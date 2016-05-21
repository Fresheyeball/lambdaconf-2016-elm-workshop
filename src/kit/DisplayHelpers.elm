module DisplayHelpers exposing (displayAsDollars)

import String


toFixed : Int -> Float -> String
toFixed precision value =
    let
        power =
            toFloat 10 ^ (toFloat precision)

        pad num =
            case num of
                [ x, y ] ->
                    [ x, String.padRight precision '0' y ]

                [ val ] ->
                    [ val, String.padRight precision '0' "" ]

                val ->
                    val
    in
        (round (value * power) |> toFloat) / power
            |> toString
            |> String.split "."
            |> pad
            |> String.join "."


displayAsDollars : Float -> String
displayAsDollars x =
    "$" ++ toFixed 2 x
