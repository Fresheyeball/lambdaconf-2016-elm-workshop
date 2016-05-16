module Update
    exposing (update)

import Model exposing (Model, LineItem, Pet)
import Msg exposing (Msg(..))


mapWhen : (Int -> Int) -> Pet -> LineItem -> LineItem
mapWhen f pet (pet', volume) =
    if pet' == pet then
        (pet', clamp 1 25 (f volume))
    else
        (pet', volume)


update : Msg -> Model -> Model
update msg model = case msg of

    -- TODO: Impliment Logic

    _ -> model
