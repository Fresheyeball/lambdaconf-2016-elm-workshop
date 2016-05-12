module Main exposing (..)

import Html.App as App
import View
import Types exposing (Model,Msg)


init : ( Model, Cmd Msg  )
init = ( [],    Cmd.none )


main : Program Never
main = App.program
    { init = init
    , update = (\msg model -> init)
    , subscriptions = (\model -> Sub.none)
    , view = View.view }
