module Components.Dropdown
    exposing (Msg, Model, update, view, init)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type Msg a
  = Toggle
  | Close
  | Select a


type alias Model a =
  { isOpen : Bool
  , placeholder : String
  , selected : Maybe a
  , options : List a }


init : String -> Maybe a -> List a -> Model a
init = Model False


update : Msg a -> Model a -> (Model a, Cmd (Msg a))
update msg model =
  case msg of

    Toggle ->
      ({ model | isOpen = not model.isOpen }, Cmd.none)

    Close ->
      ({ model | isOpen = False }, Cmd.none)

    Select x ->
      ({ model | isOpen = False
               , selected = Just x }, Cmd.none)


option : a -> Html (Msg a)
option a = button
  [ class "dropdown-item", onClick (Select a) ]
  [ text (toString a) ]


mainText : Model a -> Html (Msg a)
mainText model =
    Maybe.map toString model.selected
    |> Maybe.withDefault model.placeholder
    |> text


view : Model a -> Html (Msg a)
view model =
  div
    [ class <| "dropdown" ++ if model.isOpen then " open" else "" ]
    [ button
      [ class "btn btn-secondary dropdown-toggle", onClick Toggle ]
      [ mainText model ]
    , div
      [ class "dropdown-menu" ]
      (List.map option model.options)
    ]
