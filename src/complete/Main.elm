module Main exposing (..)

import Html.App as App
import Model
import View
import Update


main : Program Never
main = App.program
    { init = (Model.init, Cmd.none)
    , update = Update.update
    , subscriptions = always Sub.none
    , view = View.view }
