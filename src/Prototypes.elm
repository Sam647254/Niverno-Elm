module Prototypes exposing (..)

import Set exposing (Set)


type Enumerability
    = Countable
    | Singleton
    | Mass


type Flavour
    = Open
    | Mid


type Receiver
    = Single
    | Multiple
    | Global


type Valency
    = Zero
    | One
    | Two


type Associability
    = Common
    | Associable
    | Intrinsic


type Direction
    = Bidirectional
    | Unidirectional


type Prototype
    = Noun
        { enumerability : Enumerability
        , associability : Associability
        , flavour : Flavour
        , stem : String
        , glossTerm : String
        , meaning : String
        , rootStems : Set String
        }
    | Verb
        { receiver : Receiver
        , valency : Valency
        , instantaneous : Bool
        , integral : Bool
        , creation : Bool
        , stem : String
        , meaning : String
        , rootStems : Set String
        , argumentMeanings : List String
        }
    | Relationship
        { direction : Direction
        , forwardMeaning : String
        , reverseMeaning : Maybe String
        , rootStems : Set String
        }
