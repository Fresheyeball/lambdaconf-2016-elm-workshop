module Update exposing (update)

import Types exposing ( Model
                      , LineItem
                      , Pet
                      , Msg(..) )
import List


noCmd : Model -> (Model, Cmd Msg)
noCmd model = ( Debug.log "model" model, Cmd.none )


update : Msg -> Model -> (Model, Cmd Msg)
update msg model = let

  add : Pet -> List LineItem -> List LineItem
  add pet lineItems =
      if List.member pet <| List.map fst lineItems then
          lineItems
      else
          lineItems ++ [ (pet, 1) ]

  mapWhen : (Int -> Int) -> Pet -> LineItem -> LineItem
  mapWhen f pet (pet', volume) =
    if pet' == pet then
      (pet', f volume)
    else
      (pet', volume)

  in case msg of
    Add pet ->
      add pet model
      |> noCmd

    Increment pet ->
      List.map (mapWhen ((+) 1) pet) model
      |> noCmd

    Decrement pet ->
      List.map (mapWhen ((+) 1) pet) model
      |> noCmd

    Delete pet ->
      List.filter (\(pet', _) -> pet' == pet) model
      |> noCmd
