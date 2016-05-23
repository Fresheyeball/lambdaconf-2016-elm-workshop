module Main exposing (..)

{-

   The entry point to an Elm application is of type `Program`. The most common usage 
   (and the only one I'm sure exists at the moment), is with `Html.App`, which contains some 
   Program constructor functions. The program structure is described in terms of the
   3 values in The Elm Achitecture, to be wired up by the Elm runtime.
   
   The type `Never` in this case is indicating that our application does not have any 'flags'.
   Which is not a topic covered in this workshop.
   
   Elm is a language which compiles to JavaScript. While the Elm compiler can output a 
   html file where Elm is automatically initialized, the start of an Elm application's life 
   still ultimately exists in JavaScript.

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
