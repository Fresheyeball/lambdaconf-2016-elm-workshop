module Components.IconButton
  exposing (view)

import Html.Attributes as Attr
import Html.Events as Events
import Html exposing (Html, button, i)


view : String -> msg -> Html msg
view x msg =
    button
        [ Attr.type' "button"
        , Attr.class "btn btn-default btn-sm"
        , Events.onClick msg ]
        [ i
            [ Attr.class ("fa fa-" ++ x) ]
            []
        ]
