module DerivationsTest exposing (..)

import Debug exposing (toString)
import Derivations exposing (..)
import Dictionary.TestDictionary exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


suite : Test
suite =
    test "apple has correct derivations" <|
        \_ ->
            let
                derivations =
                    [ Nonspecific, Specific, Anaphor, Archetype, Associated ]
            in
            derivations
                |> List.filter (\d -> isInflectionOf apple d)
                |> Expect.equalLists derivations
