module Update
    exposing (update)

import Model exposing (Model,LineItem,Pet)
import Msg exposing (Msg(..))
import Components.Dropdown as Dropdown
import List


noCmd : Model -> (Model, Cmd Msg)
noCmd model = ( model, Cmd.none )


add : Pet -> List LineItem -> List LineItem
add pet lineItems =
    if List.member pet <| List.map fst lineItems then
        lineItems
    else
        lineItems ++ [ (pet, 1) ]


mapWhen : (Int -> Int) -> Pet -> LineItem -> LineItem
mapWhen f pet (pet', volume) =
    if pet' == pet then
        (pet', clamp 1 25 (f volume))
    else
        (pet', volume)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model = case msg of

    Add pet ->
        { model | cart = add pet model.cart }
        |> noCmd

    Increment pet ->
        { model | cart =
            List.map (mapWhen ((+) 1) pet) model.cart }
        |> noCmd

    Decrement pet ->
        { model | cart =
            List.map (mapWhen (flip (-) 1) pet) model.cart }
        |> noCmd

    Delete pet ->
        { model | cart =
            List.filter (\(pet', _) -> pet' /= pet) model.cart }
        |> noCmd

    Dropdown msg ->
        let (newSelect, newCmd) =
            Dropdown.update msg model.select
        in
            ({ model | select = newSelect }
            , Cmd.map Dropdown newCmd)

    NoOp ->
        (model, Cmd.none)
