module Update exposing (update)

import Types exposing ( Model
                      , LineItem
                      , Pet
                      , Msg(..) )

import List exposing (member)

add : Pet -> List LineItem -> List LineItem
add pet ls =
    if List.member pet <| List.map fst ls then
        ls ++ [ (pet, 1) ]
    else
        ls


no : Model -> (Model, Cmd Msg)
no model = ( model, Cmd.none )


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Add pet -> ( add pet model, Cmd.none )
        _ -> ( model, Cmd.none )
