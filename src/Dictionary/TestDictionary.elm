module Dictionary.TestDictionary exposing (..)

import Prototypes exposing (..)
import Set


apple : Prototype
apple =
    Noun
        { enumerability = Countable
        , associability = Associable
        , flavour = Open
        , stem = "lep"
        , glossTerm = "apple"
        , meaning = "apple"
        , rootStems = Set.empty
        }
