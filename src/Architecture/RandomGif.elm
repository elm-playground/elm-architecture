module RandomGif where

import Effects exposing (Effects, Never)
import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Json.Decode as Json
import Http
import Task

(=>) = (,)

-- EFFECTS
getRandomGif: String -> Effects Action
getRandomGif topic =
    Http.get decodeUrl (randomUrl topic)
    |> Task.toMaybe
    |> Task.map NewGif
    |> Effects.task

randomUrl: String -> String
randomUrl topic =
    Http.url "http://api.giphy.com/v1/gifs/random"
        [ "api_key" => "dc6zaTOxFJmzC" , "tag" => topic ]

decodeUrl : Json.Decoder String
decodeUrl =
    Json.at ["data", "image_url"] Json.string

-- MODEL
type alias Model =
    { topic: String
    , gifUrl: String }

init: String -> (Model, Effects Action)
init topic =
    ( Model topic "assets/wating.gif"
    , getRandomGif topic)


-- UPDATE
type Action
    = RequestMore
    | NewGif (Maybe String)