import Html exposing (Html, div, text)
import Html.Attributes exposing (style, id, class)
import Html.App as App
import Cell

--To Do--

    -- welcome page

    -- design levels

main =
    App.program
        { init = init -----values----
        , update = update
        , view = view
        , subscriptions = subscriptions
        }

-- MODEL

type alias Model = List Cell.Model

init : (Model, Cmd Msg)
init = (List.map Cell.init [{x = 1, y = 2}, {x = 3, y = 3}, {x = 4, y = 2}]) ! []

-- Update

type Msg
    = Up
    | Down
    | Left
    | Right

update : Msg -> Model -> (Model, Cmd Msg)
update message model =
    case message of
        _ -> model ! []



-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

-- VIEW

view : Model -> Html Msg
view model =
        div [ id "main" ] (List.map Cell.view model)
