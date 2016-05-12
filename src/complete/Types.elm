module Types exposing (..)


type Pet
    = Furby
    | Dragon
    | GelatinousBlob


type alias LineItem
    = (Pet, Int)


type alias Model
    = List LineItem


type Msg
    = Add Pet
    | Increment Pet
    | Decrement Pet
    | Delete Pet
