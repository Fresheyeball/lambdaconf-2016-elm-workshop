module Model
    exposing (..)


import Components.Dropdown as Dropdown


type Pet
    = Furby
    | Dragon
    | GelatinousBlob


type alias LineItem
    = (Pet, Int)


type alias Model =
    { cart : List LineItem
    , select : Dropdown.Model Pet }


init : Model
init =
    { cart = []
    , select = Dropdown.init
        "Select Pet"
        Nothing
        [ Furby
        , Dragon
        , GelatinousBlob ] }
