module Model exposing (..)

import Components.Dropdown as Dropdown


type Pet
    = Furby
    | Dragon
    | GelatinousBlob


type alias Price =
    Float


type alias Quantity =
    Int


type alias LineItem =
    ( Pet, Quantity )


type alias Model =
    { cart : List LineItem
    , select : Dropdown.Model Pet
    }


init : Model
init =
    { cart = []
    , select =
        Dropdown.init displayPet
            "Select Pet"
            Nothing
            [ Furby
            , Dragon
            , GelatinousBlob
            ]
    }


displayPet : Pet -> String
displayPet pet =
    case pet of
        Furby ->
            "Furby"

        Dragon ->
            "Dragon"

        GelatinousBlob ->
            "Gelatinous Blob"


price : Pet -> Price
price pet =
    case pet of
        Furby ->
            12.99

        Dragon ->
            44.99

        GelatinousBlob ->
            19.99
