module Prototypes exposing (..)


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


type alias Noun =
    { enumerability : Enumerability
    , associability : Associability
    , flavour : Flavour
    , stem : String
    , glossTerm : String
    , meaning : String
    , rootStems : Set String
    }
