module Components.Dropdown exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type Msg a
  = Toggle
  | Close
  | Select a


type alias Model a =
  { isOpen : Bool
  , selected : a
  , options : List a }


update : Msg a -> Model a -> (Model a, Cmd a)
update msg model =
  case msg of

    Toggle ->
      ({ model | isOpen = not model.isOpen }, Cmd.none)

    Close ->
      ({ model | isOpen = False }, Cmd.none)

    Select x ->
      ({ model | isOpen = False
               , selected = x}, Cmd.none)


option : a -> Html (Msg a)
option a = button
  [ class "dropdown-item", onClick (Select a) ]
  [ text (toString a) ]


view : Model a -> Html (Msg a)
view model =
  div
    [ class <| "dropdown" ++ if model.isOpen then " open" else "" ]
    [ button
      [ class "btn btn-secondary dropdown-toggle", onClick Toggle ]
      [ text "Dropdown" ]
    , div
      [ class "dropdown-menu" ]
      (List.map option model.options)      
    ]
