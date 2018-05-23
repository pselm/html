module Examples.Field where

import Elm.Default

import Control.Monad.Aff (launchAff_)
import Control.Monad.Eff (Eff)
import Control.Monad.IO (INFINITY, runIO)
import Elm.Platform (runProgram)
import Elm.String (reverse) as String
import Elm.Html (beginnerProgram, div, input, text)
import Elm.Html.Attributes (placeholder, style)
import Elm.Html.Events (onInput)
import Prelude (Unit, unit, ($))


main :: Eff (infinity :: INFINITY) Unit
main =
    launchAff_ $ runIO do
        runProgram unit $
            beginnerProgram
                { model : ""
                , update
                , view
                }


-- UPDATE

data Msg = NewContent String

update (NewContent content) oldContent =
  content


-- VIEW

view content =
  div []
    [ input [ placeholder "Text to reverse", onInput NewContent, myStyle ] []
    , div [ myStyle ] [ text (String.reverse content) ]
    ]

myStyle =
  style
    [ ("width" /\ "100%")
    , ("height" /\ "40px")
    , ("padding" /\ "10px 0")
    , ("font-size" /\ "2em")
    , ("text-align" /\ "center")
    ]
