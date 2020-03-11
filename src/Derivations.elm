module Derivations exposing (..)

import Prototypes exposing (..)
import Set exposing (Set)



-- Words are of the format (stem)(derivation)*(inflection)


type
    Inflection
    -- Noun infletions
    = Nonspecific -- "an apple"
    | Specific -- "a certain apple"
    | Anaphor -- "the (previously mentioned) apple"
    | Archetype -- "apples" as in "I like apples"
    | Associated -- "my apple(s)"
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


isDerivationOf : Prototype -> Derivation -> Bool
isDerivationOf prototype derivation =
    False


isInflectionOf : Prototype -> Inflection -> Bool
isInflectionOf prototype inflection =
    False
