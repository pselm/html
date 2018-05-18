module Examples.Form where

import Elm.Default

import Control.Monad.Aff (launchAff_)
import Control.Monad.Eff (Eff)
import Control.Monad.IO (INFINITY, runIO)
import Elm.Platform (runProgram)
import Html (Html, beginnerProgram, div, input, text)
import Html.Attributes (placeholder, style, type_)
import Html.Events (onInput)
import Prelude (Unit, unit, ($))


main :: Eff (infinity :: INFINITY) Unit
main =
    launchAff_ $ runIO do
        runProgram unit $
            beginnerProgram
                { model
                , update
                , view
                }


-- MODEL


type Model =
  { name :: String
  , password :: String
  , passwordAgain :: String
  }


model :: Model
model =
  { name : ""
  , password : ""
  , passwordAgain : ""
  }



-- UPDATE


data Msg
    = Name String
    | Password String
    | PasswordAgain String


update :: Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      model { name = name }

    Password password ->
      model { password = password }

    PasswordAgain password ->
      model { passwordAgain = password }



-- VIEW


view :: Model -> Html Msg
view model =
  div []
    [ input [ type_ "text", placeholder "Name", onInput Name ] []
    , input [ type_ "password", placeholder "Password", onInput Password ] []
    , input [ type_ "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
    , viewValidation model
    ]


viewValidation :: ∀ msg. Model -> Html msg
viewValidation model =
  let
    (color /\ message) =
      if model.password == model.passwordAgain then
        ("green" /\ "OK")
      else
        ("red" /\ "Passwords do not match!")
  in
    div [ style [("color" /\ color)] ] [ text message ]
