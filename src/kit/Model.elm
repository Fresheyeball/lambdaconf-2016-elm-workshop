module Model
    exposing (..)


-- TODO: Add more interesting Pets
type Pet
    = Furby
    | Dragon
    | GelatinousBlob


type alias Price = Float
type alias Quantity = Int


type alias LineItem
    = (Pet, Quantity)

-- TODO: Wire Dropdown Component into Model
type alias Model =
    { cart : List LineItem }


init : Model
init =
    { cart = [] }


displayPet : Pet -> String
displayPet pet =
    case pet of
        Furby -> "Furby"
        Dragon -> "Dragon"
        GelatinousBlob -> "Gelatinous Blob"


price : Pet -> Price
price pet =
    case pet of
        Furby -> 12.99
        Dragon -> 44.99
        GelatinousBlob -> 19.99
