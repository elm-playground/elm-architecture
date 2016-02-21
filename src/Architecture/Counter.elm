
module Counter (Model, init, Action, update, view) where

import Signal exposing (Address)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import StartApp.Simple as StartApp

-- MODEL
type alias Model = Int

init: Int -> Model
init counter = counter

model = 1

-- UPDATE
type Action =
    Increment | Decrement | Double

update: Action -> Model -> Model
update action model =
    case action of
        Increment -> model + 1
        Decrement -> model - 1
        Double -> model * 2

-- VIEW
view: Address Action -> Model -> Html
view address model =
    div []
        [ button [ onClick address Decrement ] [ text "--" ]
        , div [ ] [ model |> toString |> text ]
        , button [ onClick address Increment ] [ text "++" ]
        , button [ onClick address Double ] [ text "Double" ]
        ]

main =
    StartApp.start { model = model, update = update, view = view }