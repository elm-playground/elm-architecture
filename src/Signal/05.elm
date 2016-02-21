import Graphics.Element exposing (..)
import Mouse
import Window
import Keyboard
import Char
import Time

delta : Signal Time.Time
delta =
    Time.fps 2
    |> Signal.map Time.inSeconds

clickPosition : Signal (Int, Int)
clickPosition =
    Signal.sampleOn delta  Mouse.position

main =
    Signal.map show clickPosition