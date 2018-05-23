module Examples.UnorderedList where

import Elm.Html (Html, beginnerProgram, li, text, ul)
import Elm.Html.Attributes

import Control.Monad.Aff (launchAff_)
import Control.Monad.Eff (Eff)
import Control.Monad.IO (INFINITY, runIO)
import Elm.Platform (runProgram)
import Prelude (Unit, unit, ($))


main :: Eff (infinity :: INFINITY) Unit
main =
    launchAff_ $ runIO do
        runProgram unit $
            beginnerProgram
                { model : unit
                , update : \msg model -> model
                , view
                }


view :: ∀ msg. Unit -> Html msg
view _ =
    ul
        [ class_ "grocery-list" ]
        [ li [] [text "Pamplemousse"]
        , li [] [text "Ananas"]
        , li [] [text "Jus d'orange"]
        , li [] [text "Boeuf"]
        , li [] [text "Soupe du jour"]
        , li [] [text "Camembert"]
        , li [] [text "Jacques Cousteau"]
        , li [] [text "Baguette"]
        ]
