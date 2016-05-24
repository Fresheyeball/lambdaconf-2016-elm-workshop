# Tasks

In this workshop we will be implementing some features using existing code as some scaffolding.

1. Make a button that adds a furby to the shopping cart
1. Increment and Decrement the quantity of furbies in the line item
1. Calculate the current cart total
1. Embed a dropdown component for selecting a pet
1. Delete a line item

## Build your mental model

Learn about how applications work by reading [Main.elm](https://github.com/Fresheyeball/lambdaconf-2016-elm-workshop/blob/master/src/kit/Main.elm)

Then take a look at the **Model** for our application here [src/kit/Model.elm](https://github.com/Fresheyeball/lambdaconf-2016-elm-workshop/blob/master/src/kit/Model.elm)

## Implementing Add

First notice `Add` in the `Msg` union type in [src/kit/Msg.elm](https://github.com/Fresheyeball/lambdaconf-2016-elm-workshop/blob/master/src/kit/Msg.elm#L9)

So our system can handle an `Add` message that contains a `Pet` as defined in our **Model**.

To make this work we will need to do 2 things

1. Put the add button into the `view` function, by using the button component, such that it sends `Add Furby` when clicked.
1. Handle incoming `Add` messages in the `update` function, by updating the model with a new `LineItem` as defined in our **Model**.

Since we already have the cart list wired up to the view, we should be able to add some furbies!

## Increment and Decrement

Now lets allow the user to increment and decrement the quantity of furbies in the cart. These new actions, just like `Add` are going to be messages that flow through the system. To make increment and decrement work is very similar to the process we just went through.

1. Document these new messages on our `Msg` type.
1. Add `onClick` event listeners to the increment and decrement buttons in the view, that send the messages of type `Msg`.
1. Handle the new messages in the `update` function, such that the model of the cart is updated appropriately.

## Calculate the Total

The total is not an new message, nor does it belong in the model (since it can be derived from the model). So for the purposes of this exercise we'll put the computation of the total in the view.

## Embed the Dropdown Component

Now that you've seen how the **5** core parts of The Elm Architecture pattern fit together. Lets embed a component into the system. This project has been prepped with a simple *dropdown* component. Sub components being made from the same **5** parts (or less as needed), is a double edged sword.

- One the one side, it provides and extreme level of flexibility, modularity, and code reuse.
- On the other side, it means wiring in a rich component potentially means touching all 5 core parts of the parent application to route stateful-ness to the sub component.

## Delete an Item

... you can do it, give it shot ...
