module View
    exposing (view)

import Msg exposing (Msg(..))
import Model exposing (Model, Pet(..))
import Html exposing (..)
import Html.App as Html
import Html.Attributes as Attr
import Components.Button as Button
import Components.Dropdown as Dropdown


css : Html Msg
css = node "link"
  [ Attr.rel "stylesheet"
  , Attr.href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" ]
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


cart : Model -> Html Msg
cart model = let
    head' = thead []
        [ tr []
            [ th []
                [ text "Pet" ]
            , th []
                [ text "Price" ]
            , th []
                [ text "Quantity" ]
            ]
        ]

    lineItem (pet, quantity) =
        [ tr []
            [ td []
                [ text (Model.displayPet pet) ]
            , td []
                [ text "bar" ]
            , td []
                [ text (toString quantity) ]
            ]
        ]

    body = tbody [] <| List.concatMap lineItem model.cart


    in div
      [ Attr.class "table-responsive" ]
      [ table
        [ Attr.class "table table-striped" ]
        [ head'
        , body
        ]
      ]


view : Model -> Html Msg
view model =
  wrap
  [ css
  , header
  , cart model
  , Html.map Dropdown (Dropdown.view model.select)
  , add model ]
