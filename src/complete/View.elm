module View exposing (view)

import Msg exposing (Msg(..))
import Model exposing (Model, Pet(..), LineItem)
import Html exposing (..)
import Html.App as Html
import Html.Attributes as Attr
import Components.IconButton as IconButton
import Components.Button as Button
import Components.Dropdown as Dropdown
import Components.Css as Css
import DisplayHelpers exposing (displayAsDollars)


bootstrap : Html Msg
bootstrap =
    Css.link "https://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/css/bootstrap.css"


fontAwesome : Html Msg
fontAwesome =
    Css.link "https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"


wrap : List (Html Msg) -> Html Msg
wrap =
    div
        [ Attr.class "container"
        , Attr.style
            [ ( "max-width", "46rem" )
            , ( "margin-top", "1.5rem" )
            , ( "background", "rgba(255,255,255,0.9)" )
            , ( "padding-bottom", "1rem" )
            ]
        ]


header : Html Msg
header =
    div [ Attr.class "header clearfix" ]
        [ h2
            [ Attr.class "text-muted"
            , Attr.style [ ( "text-align", "center" ) ]
            ]
            [ text "Skeezoyd's Perfectly Normal Pet Emporium" ]
        ]


add : Model -> Html Msg
add model =
    case model.select.selected of
        Just pet ->
            Button.view (Add pet) "Add"

        Nothing ->
            Button.view NoOp "Add"


quantityControl : Pet -> Html Msg
quantityControl pet =
    div
        [ Attr.class "btn-group btn-group-sm"
        , Attr.style [ ( "margin-left", "1rem" ) ]
        ]
        [ IconButton.view "minus" (Decrement pet)
        , IconButton.view "plus" (Increment pet)
        ]


textAlign : String -> Attribute Msg
textAlign x =
    Attr.style [ ( "text-align", x ) ]


lineItem : LineItem -> Html Msg
lineItem ( pet, quantity ) =
    tr []
        [ td []
            [ text (Model.displayPet pet) ]
        , td []
            [ text (displayAsDollars (Model.price pet)) ]
        , td [ textAlign "right" ]
            [ text (toString quantity)
            , quantityControl pet
            ]
        , td [ textAlign "right" ]
            [ IconButton.view "times" (Delete pet) ]
        ]


emptyCart : Html Msg
emptyCart =
    tr []
        [ td
            [ Attr.colspan 4
            , textAlign "center"
            ]
            [ text "Your Cart Is Empty" ]
        ]


cart : Model -> Html Msg
cart model =
    let
        body =
            tbody []
                <| case List.map lineItem model.cart of
                    [] ->
                        [ emptyCart ]

                    x ->
                        x

        head' =
            thead []
                [ tr []
                    [ th [] [ text "Pet" ]
                    , th [] [ text "Price" ]
                    , th [ textAlign "right" ] [ text "Quantity" ]
                    , th [ textAlign "right" ] [ text "Remove" ]
                    ]
                ]
    in
        div
            [ Attr.class "table-responsive"
            , Attr.style [ ( "margin-top", "2rem" ) ]
            ]
            [ table [ Attr.class "table table-striped" ]
                [ head'
                , body
                ]
            ]


total : Model -> Html Msg
total model =
    let
        subtotal ( pet, quantity ) acc =
            acc + Model.price pet * toFloat quantity

        total' =
            List.foldr subtotal 0 model.cart
    in
        wrap
            [ h4 [ Attr.style [ ( "text-align", "right" ) ] ]
                [ text <| "Total: " ++ displayAsDollars total' ]
            ]


background : Html Msg -> Html Msg
background app =
  div [ Attr.style [ ("background", "url('http://i.imgur.com/f9wAIL7.png') no-repeat bottom center fixed" )
                   , ("width", "100%")
                   , ("height", "100%")
                   , ("padding-top", "1rem")] ]
      [ app
      ]


view : Model -> Html Msg
view model =
    background <| wrap
        [ bootstrap
        , fontAwesome
        , header
        , cart model
        , total model
        , div [ Attr.class "form-inline form-control" ]
            [ label [] [ text "Add Pet To Cart" ]
            , Html.map Dropdown (Dropdown.view model.select)
            , add model
            ]
        ]
