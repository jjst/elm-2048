module Cell exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (style, id, class)
import Html.App as App
import Color

main =
    App.beginnerProgram
        { model = init { x = 1, y = 2 }
        , update = update
        , view = view
        }


-- MODEL

minValue = 1
maxValue = 11

type alias Coords =
    { x : Int
    , y : Int
    }

type alias Model =
    { coords : Coords
    , value : Int
    }

init : Coords -> Model
init coords =
    { coords = coords
    , value = minValue
    }
    

-- UPDATE

type Msg
    = Combine Model

update : Msg -> Model -> Model
update message ({ coords, value } as model) =
    case message of
        Combine otherCell ->
           if value == otherCell.value then
              { model | value = value + 1 }
           else 
              model


-- VIEW

view : Model -> Html a
view ({ coords, value } as model) =
    let
        color = Color.hsl (degrees (66.0 - (toFloat value) * 6.0)) 1 0.5
        {red, green, blue, alpha} = Color.toRgb color
        divStyle =
            style
                [ ("position", "absolute")
                , ("width", "100px")
                , ("height", "100px")
                , ("text-align", "center")
                , ("vertical-align", "middle")
                , ("line-height", "100px")
                , ("font-weight", "bold")
                , ("font-size", "24px")
                , ("background", "rgb(" ++ (toString red) ++ "," ++ (toString green) ++ "," ++ (toString blue) ++ ")")
                , ("border-radius", "30%")
                , ("left", (toString (100 * coords.x)) ++ "px")
                , ("top", (toString (100 * coords.y)) ++ "px")
                ]
        
    in
       div [ divStyle ] [ text (toString value) ]
