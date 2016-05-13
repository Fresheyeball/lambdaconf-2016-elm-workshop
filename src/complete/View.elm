module View exposing (view)

import Types exposing ( Model, Msg(..), Pet(..) )
import Html exposing (..)
import Html.Attributes as Attr
import Html.Events as Events


css : Html Msg
css = node "link"
  [ Attr.rel "stylesheet"
  , Attr.href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" ]
  []


view : Model -> Html Msg
view model =
  div []
  [ css
  , button [ Events.onClick (Add Furby) ] [ text "Add Furby" ] ]
