module Main exposing (..)

import Html.App as App
import Model
import View
import Update

{-
  An Elm application consists of (atleast) 3 parts

  An initial `Model`,
  a transform function `update : Msg -> Model -> Model`,
  and a view function `view : Model -> Html Msg`

  While Elm is no longer a FRP language and does not feature `Signal`s,
  the core application structure Elm dictates comes from the emergent
  properties of `Signal`s. You can think of Elm like an FRP language,
  where working with `Signal`s has been made so abstract, its become opaque.

  Essentially
-}

main : Program Never
main = App.beginnerProgram
    { model = Model.init
    , update = Update.update
    , view = View.view }
