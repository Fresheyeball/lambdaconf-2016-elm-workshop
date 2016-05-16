module Msg
    exposing (Msg(..))

import Model exposing (Pet)


-- TODO: Add the rest of the user actions
type Msg
    = Add Pet
    | NoOp
