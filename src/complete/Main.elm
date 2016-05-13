module Main exposing (..)

import Html.App as App
import Types exposing ( Model, Msg )
import View
import Update


init : ( Model, Cmd Msg  )
init = ( [],    Cmd.none )


main : Program Never
main = App.program
    { init = init
    , update = Update.update
    , subscriptions = (\model -> Sub.none)
    , view = View.view }
