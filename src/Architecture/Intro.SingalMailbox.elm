
import Html exposing (..)
import Html.Events exposing (onClick)

view: Signal.Address String -> String -> Html
view address message =
    div
        []
        [ div [] [ text message ]
        , button [onClick address "Jannine Weigel"] [ text "Click" ] ]

mb: Signal.Mailbox String
mb = Signal.mailbox "What's yout name?"

main: Signal Html
main =
    Signal.map (view mb.address) mb.signal