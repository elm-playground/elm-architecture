import Html exposing (..)
import Mouse

view: Int -> Html
view count =
    count |> toString |> text

countSignal: Signal Int
countSignal =
    -- Signal.map (always 1) Mouse.clicks
    Signal.foldp (\_ state -> state + 1) 0 Mouse.clicks

main: Signal Html
main =
    Signal.map view countSignal
