module View
    exposing (view)

import String
import Msg exposing (Msg(..))
import Model exposing (Model, Pet(..))
import Html exposing (..)
import Html.App as Html
import Html.Attributes as Attr
import Html.Events as Events
import Components.Button as Button
import Components.Dropdown as Dropdown


css : Html Msg
css = node "link"
  [ Attr.rel "stylesheet"
  , Attr.href "https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/css/bootstrap.css" ]
  []


wrap : List (Html Msg) -> Html Msg
wrap = div
    [ Attr.class "container"
    , Attr.style [("max-width", "46rem")
                 ,("margin-top", "1.5rem")]]


header : Html Msg
header =
    div
    [ Attr.class "header clearfix" ]
    [ h3
        [ Attr.class "text-muted" ]
        [ text "Funky Pet Shop" ] ]


add : Model -> Html Msg
add model =
    case model.select.selected of
        Just pet -> Button.view (Add pet) "Add"
        Nothing -> Button.view NoOp "Add"


toFixed : Int -> Float -> String
toFixed precision value =
    let
        power = toFloat 10 ^ (toFloat precision)
        pad num = case num of
            [x, y] ->
                [x, String.padRight precision '0' y]
            [val] ->
                [val, String.padRight precision '0' ""]
            val ->
                val
  in
    (round (value * power) |> toFloat) / power
    |> toString
    |> String.split "."
    |> pad
    |> String.join "."


displayAsDollars : Float -> String
displayAsDollars x = "$" ++ toFixed 2 x


cart : Model -> Html Msg
cart model = let
    head' = thead []
        [ tr []
            [ th [] [ text "Pet" ]
            , th [] [ text "Price" ]
            , th [] [ text "Quantity" ]
            ]
        ]


    quantityControl pet =
        div [ Attr.class "btn-group btn-group-sm"
            , Attr.style [("margin-left","1rem")]]
            [ button [ Attr.class "btn"
                     , Events.onClick (Decrement pet) ] [ text "-" ]
            , button [ Attr.class "btn"
                     , Events.onClick (Increment pet) ] [ text "+" ] ]


    lineItem (pet, quantity) =
        [ tr []
            [ td []
                [ text (Model.displayPet pet) ]
            , td []
                [ text (displayAsDollars (Model.price pet)) ]
            , td []
                [ text (toString quantity)
                , quantityControl pet ]
            ]
        ]


    emptyCart =
        [ tr []
            [ td [ Attr.colspan 3
                 , Attr.style [("text-align","center")]]
                 [ text "Your Cart Is Empty" ] ]
        ]


    body = tbody [] <|
        case List.concatMap lineItem model.cart of
            [] -> emptyCart
            x -> x


    in div
        [ Attr.class "table-responsive" ]
        [ table
            [ Attr.class "table table-striped" ]
            [ head'
            , body
            ]
        ]


total : Model -> Html Msg
total model = let
    subtotal (pet, quantity) acc =
        acc + Model.price pet * toFloat quantity

    total' = List.foldr subtotal 0 model.cart

    in wrap
        [ h3 [] [ text <| "Total: " ++ displayAsDollars total' ]]


view : Model -> Html Msg
view model =
    wrap
    [ css
    , header
    , cart model
    , total model
    , div [ Attr.class "form-inline form-control" ]
        [ label [] [ text "Add Pet To Cart" ]
        , Html.map Dropdown (Dropdown.view model.select)
        , add model
        ]
    ]
