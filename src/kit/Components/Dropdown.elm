module Components.Dropdown exposing (Msg, Model, update, view, init)

{-

   Dropdowns are stateful! So we structure the Dropdown
   component like a smaller Elm application, with the same
   basic parts as the parent.

   - Msg
   - Model
   - init
   - update
   - view

-}

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


{-

   The types of messages that flow through
   the Dropdown component. Here our `Msg` type is
   parameterized with `a`, so that what gets selected
   can be polymorphic, and only concrete in the
   parent application. IE the Dropdown shouldn't know
   what is being selected, just that its a type.

   We will need to reference this type in the parent application's
   `Msg` type so that Dropdown messages can flow.

-}


type Msg a
    = Toggle
    | Close
    | Select a



{-

   The Model of the Dropdown. All the aspects of a dropdown that
   change over time, or can be configured are documented here.
   `Model` is parameterized by `a`, for the same reason `Msg` is
   parameterized; the Dropdown shouldn't need to know what is being
   selected, merely that its a type.

   We will need to reference this type from the parent application's
   Model type, so we can track the state of our Dropdowns.

-}


type alias Model a =
    { isOpen : Bool
    , display : a -> String
    , placeholder : String
    , selected : Maybe a
    , options : List a
    }



{-

   This is a helper function to create the initial state of a
   Dropdown. We might have more than one Dropdown in our application
   so, there is not a single canonical initial dropdown state.
   Except that `isOpen = False`, as dropdowns start life closed.

   We will need to reference this from the parent application somewhere,
   probably in the parent's initial state declaration.

-}


init : (a -> String) -> String -> Maybe a -> List a -> Model a
init =
    Model False



{-

   This is the update function for the Dropdown component.
   Alters the model depending on the `Msg a` recieved.

   We will need to call this function from the parent application's
   update function to wire in a Dropdown.

-}


update : Msg a -> Model a -> Model a
update msg model =
    case msg of
        Toggle ->
            { model | isOpen = not model.isOpen }

        Close ->
            { model | isOpen = False }

        Select x ->
            { model
                | isOpen = False
                , selected = Just x
            }


option : String -> a -> Html (Msg a)
option label x =
    button [ class "dropdown-item", onClick (Select x) ]
        [ text label ]


mainText : Model a -> Html (Msg a)
mainText model =
    Maybe.map model.display model.selected
        |> Maybe.withDefault model.placeholder
        |> text



{-

   View function for the Dropdown component.

   We will need to call this function in the parent's view
   to wire in this component.

-}


view : Model a -> Html (Msg a)
view model =
    div
        [ class
            <| "dropdown"
            ++ if model.isOpen then
                " open"
               else
                ""
        , style
            [ ( "display", "inline-block" )
            , ( "margin", "0 1rem" )
            ]
        ]
        [ button [ class "btn btn-secondary dropdown-toggle", onClick Toggle ]
            [ mainText model ]
        , div [ class "dropdown-menu" ]
            (List.map (\x -> option (model.display x) x) model.options)
        ]
