module Main exposing (..)

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
