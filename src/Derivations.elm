module Derivations exposing
    ( Derivation(..)
    , DerivedPrototype
    , Inflection(..)
    , derivationsOf
    , inflectionsOf
    )

import EverySet exposing (EverySet)
import Prototypes exposing (..)



-- Words are of the format (stem)(derivation)*(inflection)


type
    Inflection
    -- Noun infletions
    = Nonspecific -- "an apple"
    | Specific -- "a certain apple"
    | Anaphor -- "the (previously mentioned) apple"
    | Archetype -- "apples" as in "I like apples"
    | Associated -- "my apple(s)"
    | Detached
      -- Verb inflections
    | StartImperative -- "eat!"
    | StopImperative -- "stop eating!"
    | Started -- not available for instantaneous verbs
    | Finished
    | NotStarted
    | Paused -- not available for integral and instantaneous verbs
    | Stopped -- not available for integral and instantaneous verbs
    | Cancelled -- not available for integral and instantaneous verbs
      -- Relationship inflections
    | Right -- "my child"
    | Left -- "my mother" (not available for bidirectional relationships)


type
    Derivation
    -- Verb derivations
    = Receiver -- noun
    | Argument1 -- noun
    | Argument2 -- noun
      -- Relationship derivations
    | Forward -- "is mother of" or "is friend of" -- verb
    | Reverse -- "is child of" (not available for bidirectional relationships) -- verb


type alias DerivedPrototype =
    { base : Prototype
    , derivations : List Derivation
    }


derivationsOf : Prototype -> EverySet Derivation
derivationsOf prototype =
    []
        |> EverySet.fromList


inflectionsOf : Prototype -> EverySet Inflection
inflectionsOf prototype =
    let
        inflections =
            case prototype of
                Noun noun ->
                    let
                        commonInflections =
                            [ Specific ]

                        enumerabilityInflections =
                            case noun.enumerability of
                                Countable ->
                                    [ Nonspecific, Archetype, Anaphor ]

                                Singleton ->
                                    []

                                Mass ->
                                    []

                        associabilityInflections =
                            case noun.associability of
                                Common ->
                                    []

                                Associable ->
                                    [ Associated ]

                                Intrinsic ->
                                    [ Detached ]
                    in
                    [ commonInflections
                    , enumerabilityInflections
                    , associabilityInflections
                    ]
                        |> List.concat

                _ ->
                    []
    in
    EverySet.fromList inflections
