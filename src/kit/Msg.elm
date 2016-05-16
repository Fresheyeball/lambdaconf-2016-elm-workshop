module Msg
    exposing (Msg(..))

import Components.Dropdown as Dropdown
import Model exposing (Pet)


type Msg
    = Add Pet
    | Increment Pet
    | Decrement Pet
    | Delete Pet
    | NoOp
    | Dropdown (Dropdown.Msg Pet)
