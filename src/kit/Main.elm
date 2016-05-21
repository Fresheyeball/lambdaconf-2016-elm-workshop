module Main exposing (..)

{-

   An Elm application consists of (atleast) 3 parts

   An initial `Model`,
   a transform function `update : Msg -> Model -> Model`,
   and a view function `view : Model -> Html Msg`

   While Elm is no longer a FRP language and does not feature `Signal`s,
   the core application structure Elm dictates comes from the emergent
   properties of `Signal`s. You can think of Elm like an FRP language,
   where working with `Signal`s has been made so abstract, its become opaque.

   Essentially you can think of it as application structured around
   a giant fold. Consider:

   folding looks something like this

   fold : (a -> b -> b) -> b -> f a -> b


   in Elm's case

   fold : (Msg -> Model -> Model) -> Model -> Signal Msg -> Signal Model


   from there its easy to get a `Signal` of `Html` for the browser to render.
   Because of this simple model, Signals can be omitted from the langauge all
   together as the runtime will just wire up your app like so:

   runtimeRender (map view (fold update init (runtimeInputs)))

   so all you have to write is the parts specific to the logic of
   your application, namely

   Msg
   Model
   model : Model
   update : Msg -> Model -> Model
   view : Model -> Html Msg

-}

import Html.App as App
import Model
import View
import Update


main : Program Never
main =
    App.beginnerProgram
        { model = Model.init
        , update = Update.update
        , view = View.view
        }
