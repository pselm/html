module Examples.HelloWorld where

import Html

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
                , view : \model -> text "Hello World"
                }
