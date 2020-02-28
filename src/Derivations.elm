module Derivations exposing (..)


type
    Derivation
    -- Noun derivations
    = Nonspecific -- "an apple"
    | Specific -- "a certain apple"
    | Anaphor -- "the (previously mentioned) apple"
    | Archetype -- "apples" as in "I like apples"
    | Associated -- "my apple(s)"
      -- Verb derivations
    | Imperative -- "eat!"
    | Started -- not available for instantaneous verbs
    | Finished
    | NotStarted
    | Paused -- not available for integral and instantaneous verbs
    | Stopped -- not available for integral and instantaneous verbs
    | Cancelled -- not available for integral and instantaneous verbs
