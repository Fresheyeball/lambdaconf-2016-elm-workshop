module Model exposing (..)

{-

   This is a union type representing the
   different `Pet`s for sale at Skeezoyd's.

-}


type Pet
    = Furby
    | Dragon
    | GelatinousBlob
    -- TODO: Add more interesting Pets

    
{-

   These are type aliases. In this case
   they serve no purpose other than to
   make our types more readable.

-}


type alias Price =
    Float


type alias Quantity =
    Int


type alias LineItem =
    ( Pet, Quantity )



{-

   This is the main Model of our application.

   ALL STATE WILL BE DOCUMENTED BY THIS TYPE.

   This is our one and only source of truth for the state of
   an Elm application. If we need a value to change over time
   it will appear on this type in some way.

   The Model is a record (which is kind of like an object).
   Learn more about record syntax http://elm-lang.org/docs/records

-}


type alias Model =
    { cart :
        List LineItem
        -- TODO: Wire Dropdown Component into Model
    }



{-

   This is the initial state of our application.

-}


init : Model
init =
    { cart = [] }


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
