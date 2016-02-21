
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Signal exposing (Address)
import String
import StartApp.Simple as StartApp

type alias Model = { value: String }

onInput : Address a -> (String -> a) -> Attribute
onInput address f =
  on "input" targetValue (\v -> Signal.message address (f v))

type Action
    = Upper
    | Lower
    | Reverse
    | Change String

init value = { value = value }

update: Action -> Model -> Model
update action model =
    case action of
        Upper ->
            { model | value = model.value |> String.toUpper }
        Lower ->
            { model | value = model.value |> String.toLower }
        Reverse ->
            { model | value = model.value |> String.reverse }
        Change value ->
            { model | value = value }


view: Address Action -> Model -> Html
view address model =
    div []
        [ input [type' "text", value model.value, name "value", onInput address Change] []
        , button [onClick address Reverse] [text "Reverse"]
        , button [onClick address Upper] [text "Upper"]
        , button [onClick address Lower] [text "Lower"]
        , span [] [text model.value] ]

main =
    StartApp.start
        { update = update, view = view, model = init "Jannine Weigel" }