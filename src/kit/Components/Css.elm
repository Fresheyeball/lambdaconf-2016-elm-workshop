module Components.Css exposing (link)

import Html.Attributes as Attr
import Html exposing (node, Html)


link : String -> Html msg
link href = node "link"
    [ Attr.rel "stylesheet"
    , Attr.href href ]
    []
