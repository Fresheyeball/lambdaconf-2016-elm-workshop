module View
    exposing (view)

import Msg exposing (Msg(..))
import Model exposing (Model, Pet(..))
import Html exposing (div, node, h3, text, Html)
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
    [ Attr.class "container" ]


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


view : Model -> Html Msg
view model =
  wrap
  [ css
  , header
  , Html.map Dropdown (Dropdown.view model.select)
  , add model ]
