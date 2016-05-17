module Msg
    exposing (Msg(..))

import Model exposing (Pet)


{-

  `Msg` is a union type representing messages
  that flow through our application.

  Union types are types with more than one constructor

  type MyType = MyValue Int | MyOtherValue
                            ^ this is a type level OR

  So that when a function takes `MyType`, it may
  recieve a value of either `MyValue Int` or `MyOtherValue`

-}
type Msg
    = Add Pet
    | NoOp
    -- TODO: Add the rest of the user actions
