

import Html
import Mouse

view: Int -> Html.Html
view x =
    Html.button [] [x |> toString |> Html.text]

main: Signal.Signal Html.Html
main =
    Signal.map view Mouse.x
