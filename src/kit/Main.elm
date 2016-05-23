module Main exposing (..)

{-

   Then entry point to an Elm application is of type `Program`. The most common usage 
   (and the only one I'm sure exists at the moment), is with `Html.App`, which contains some 
   Program constructor functions. The program structure is described in terms of the
   3 values in The Elm Achitecture, to be wired up by the Elm runtime.

-}

import Html.App as App
import Model
import View
import Update


main : Program Never
main =
    App.beginnerProgram
        { model = Model.init
        , update = Update.update
        , view = View.view
        }
