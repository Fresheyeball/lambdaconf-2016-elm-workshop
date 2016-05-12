module Main exposing (..)

import Html.App as App
import Html exposing (text)


init : (Int, Cmd a)
init = (0, Cmd.none)


main : Program Never
main = App.program
    { init = init
    , update = (\msg model ->  init)
    , subscriptions = (\model -> Sub.none)
    , view = (\model -> text "foo") }
