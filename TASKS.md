# Tasks

In this workshop we will be implementing some features using existing code as some scaffolding.

1. Add a furby to the shopping cart
1. Increment and Decrement the quantity of furbies in the line item
1. Calculate the current cart total
1. Embed a dropdown component for selecting a pet
1. Delete a line item

## Build your mental model

Learn about how applications work by reading [Main.elm](https://github.com/Fresheyeball/lambdaconf-2016-elm-workshop/blob/master/src/kit/Main.elm)

Then take a look at the **Model** for our application here [src/kit/Model.elm](https://github.com/Fresheyeball/lambdaconf-2016-elm-workshop/blob/master/src/kit/Model.elm)

 See the core library here:

### [You will likely need to reference **Elm's** core libraries to complete these tasks. See the core library here.](http://package.elm-lang.org/packages/elm-lang/core/4.0.0/Basics)

## Implementing Add

First notice `Add` in the `Msg` union type in [src/kit/Msg.elm](https://github.com/Fresheyeball/lambdaconf-2016-elm-workshop/blob/master/src/kit/Msg.elm#L9)

So our system can handle an `Add` message that contains a `Pet` as defined in our **Model**.

To make this work we will need to do 2 things

1. Put the add button into the `view` function, by using the button component, such that it sends `Add Furby` when clicked.
1. Handle incoming `Add` messages in the `update` function, by updating the model with a new `LineItem` as defined in our **Model**.

Since we already have the cart list wired up to the view, we should be able to add some furbies! 
