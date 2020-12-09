module Main exposing (..)

import Browser 
import Html exposing (div, text, input, button)
import Html.Events exposing (onClick, onInput)
import Debug exposing (log)

type Messages = 
    Add
    | UpdateAge String



init = {
    value = 0
    , numberToAdd = 0
    }

view model = 
    div [] [
        text (String.fromInt model.value)
        , div [] []
        , input [onInput UpdateAge] []
        , button [onClick Add] [text "Add"]
        ]

parseUserNumber text = 
    let
        maybeValue = String.toInt text
    in

    case maybeValue of
       Just val ->
            val
        
       Nothing -> 
            0

update msg model = 
    let
        message = log "message:" msg
        message2 = log "message 2:" model
    in
    case msg of
        Add ->
            {model | value = model.value + model.numberToAdd }
        
        UpdateAge age ->
            let
                m = log "age:" age
            in

            { model | numberToAdd = parseUserNumber age}
    

main = 
    Browser.sandbox {
        init = init
        , view = view
        , update = update
    }