module Examples.Buttons where

import Elm.Default

import Control.Monad.Aff (launchAff_)
import Control.Monad.Eff (Eff)
import Control.Monad.IO (INFINITY, runIO)
import Elm.Platform (runProgram)
import Html (Html, beginnerProgram, button, div, text)
import Html.Events (onClick)
import Prelude (class Eq, Unit, unit, ($))


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

model :: Int
model = 0


-- UPDATE

data Msg = Increment | Decrement

derive instance eqMsg :: Eq Msg


update :: Msg -> Int -> Int
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1


-- VIEW

view :: Int -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]

