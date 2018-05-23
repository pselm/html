module Examples.Random where

import Elm.Default

import Control.Monad.Aff (launchAff_)
import Control.Monad.Eff (Eff)
import Control.Monad.IO (INFINITY, runIO)
import Elm.Platform (runProgram)
import Elm.Platform.Cmd (none) as Cmd
import Elm.Platform.Sub (none) as Sub
import Elm.Random (generate, int) as Random
import Elm.Html (Html, button, div, h1, program, text)
import Elm.Html.Events (onClick)
import Prelude (class Eq, Unit, unit, ($))



main :: Eff (infinity :: INFINITY) Unit
main =
    launchAff_ $ runIO do
        runProgram unit $
            program
                { init
                , view
                , update
                , subscriptions
                }


-- MODEL


type Model =
    { dieFace :: Int
    }


mkModel :: Int -> Model
mkModel = { dieFace : _ }


init :: (Model /\ Cmd Msg)
init =
    ( mkModel 1 /\ Cmd.none )



-- UPDATE


data Msg
  = Roll
  | NewFace Int

derive instance eqMsg :: Eq Msg


update :: Msg -> Model -> (Model /\ Cmd Msg)
update msg model =
  case msg of
    Roll ->
      (model /\ Random.generate NewFace (Random.int 1 6))

    NewFace newFace ->
      (mkModel newFace /\ Cmd.none)



-- SUBSCRIPTIONS


subscriptions :: Model -> Sub Msg
subscriptions model =
  Sub.none



-- VIEW


view :: Model -> Html Msg
view model =
  div []
    [ h1 [] [ text (toString model.dieFace) ]
    , button [ onClick Roll ] [ text "Roll" ]
    ]
