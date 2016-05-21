module Components.Button
    exposing (view)

import Html
import Html.Attributes as Attr
import Html.Events as Events


view : msg -> String -> Html.Html msg
view msg label =
    Html.button [ Attr.type' "button"
                , Attr.class "btn btn-primary"
                , Events.onClick msg ]
                [ Html.text label ]
