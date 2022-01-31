module Generated.CommenthubAPI exposing(..)

import Json.Decode
import Json.Encode exposing (Value)
-- The following module comes from bartavelle/json-helpers
import Json.Helpers exposing (..)
import Dict exposing (Dict)
import Set
import Http
import String
import Url.Builder

maybeBoolToIntStr : Maybe Bool -> String
maybeBoolToIntStr mx =
  case mx of
    Nothing -> ""
    Just True -> "1"
    Just False -> "0"

type alias GetApiInfoResponse  =
   { apiInfoResponse'apiInfo: ApiInfo
   }

jsonDecGetApiInfoResponse : Json.Decode.Decoder ( GetApiInfoResponse )
jsonDecGetApiInfoResponse =
   Json.Decode.succeed (\papiInfoResponse'apiInfo -> {apiInfoResponse'apiInfo = papiInfoResponse'apiInfo}) |> custom (jsonDecApiInfo)

jsonEncGetApiInfoResponse : GetApiInfoResponse -> Value
jsonEncGetApiInfoResponse  val =
   jsonEncApiInfo val.apiInfoResponse'apiInfo


type alias PostCommentRequest  =
   { postCommentRequest'document_id: Int
   , postCommentRequest'content: String
   }

jsonDecPostCommentRequest : Json.Decode.Decoder ( PostCommentRequest )
jsonDecPostCommentRequest =
   Json.Decode.succeed (\ppostCommentRequest'document_id ppostCommentRequest'content -> {postCommentRequest'document_id = ppostCommentRequest'document_id, postCommentRequest'content = ppostCommentRequest'content})
   |> required "postCommentRequest'document_id" (Json.Decode.int)
   |> required "postCommentRequest'content" (Json.Decode.string)

jsonEncPostCommentRequest : PostCommentRequest -> Value
jsonEncPostCommentRequest  val =
   Json.Encode.object
   [ ("postCommentRequest'document_id", Json.Encode.int val.postCommentRequest'document_id)
   , ("postCommentRequest'content", Json.Encode.string val.postCommentRequest'content)
   ]



type alias Comment  =
   { comment'id: Int
   , comment'user_id: String
   , comment'document_id: Int
   , comment'content: String
   }

jsonDecComment : Json.Decode.Decoder ( Comment )
jsonDecComment =
   Json.Decode.succeed (\pcomment'id pcomment'user_id pcomment'document_id pcomment'content -> {comment'id = pcomment'id, comment'user_id = pcomment'user_id, comment'document_id = pcomment'document_id, comment'content = pcomment'content})
   |> required "comment'id" (Json.Decode.int)
   |> required "comment'user_id" (Json.Decode.string)
   |> required "comment'document_id" (Json.Decode.int)
   |> required "comment'content" (Json.Decode.string)

jsonEncComment : Comment -> Value
jsonEncComment  val =
   Json.Encode.object
   [ ("comment'id", Json.Encode.int val.comment'id)
   , ("comment'user_id", Json.Encode.string val.comment'user_id)
   , ("comment'document_id", Json.Encode.int val.comment'document_id)
   , ("comment'content", Json.Encode.string val.comment'content)
   ]



type alias PostDocumentRequest  =
   { postDocumentRequest'name: String
   , postDocumentRequest'content: String
   }

jsonDecPostDocumentRequest : Json.Decode.Decoder ( PostDocumentRequest )
jsonDecPostDocumentRequest =
   Json.Decode.succeed (\ppostDocumentRequest'name ppostDocumentRequest'content -> {postDocumentRequest'name = ppostDocumentRequest'name, postDocumentRequest'content = ppostDocumentRequest'content})
   |> required "postDocumentRequest'name" (Json.Decode.string)
   |> required "postDocumentRequest'content" (Json.Decode.string)

jsonEncPostDocumentRequest : PostDocumentRequest -> Value
jsonEncPostDocumentRequest  val =
   Json.Encode.object
   [ ("postDocumentRequest'name", Json.Encode.string val.postDocumentRequest'name)
   , ("postDocumentRequest'content", Json.Encode.string val.postDocumentRequest'content)
   ]



type alias Document  =
   { document'id: Int
   , document'user_id: String
   , document'name: String
   , document'content: String
   }

jsonDecDocument : Json.Decode.Decoder ( Document )
jsonDecDocument =
   Json.Decode.succeed (\pdocument'id pdocument'user_id pdocument'name pdocument'content -> {document'id = pdocument'id, document'user_id = pdocument'user_id, document'name = pdocument'name, document'content = pdocument'content})
   |> required "document'id" (Json.Decode.int)
   |> required "document'user_id" (Json.Decode.string)
   |> required "document'name" (Json.Decode.string)
   |> required "document'content" (Json.Decode.string)

jsonEncDocument : Document -> Value
jsonEncDocument  val =
   Json.Encode.object
   [ ("document'id", Json.Encode.int val.document'id)
   , ("document'user_id", Json.Encode.string val.document'user_id)
   , ("document'name", Json.Encode.string val.document'name)
   , ("document'content", Json.Encode.string val.document'content)
   ]


postApiComment : PostCommentRequest -> (Result Http.Error  (Comment)  -> msg) -> Cmd msg
postApiComment body toMsg =
    let
        params =
            List.filterMap identity
            (List.concat
                [])
    in
        Http.request
            { method =
                "POST"
            , headers =
                []
            , url =
                Url.Builder.crossOrigin ""
                    [ "api"
                    , "comment"
                    ]
                    params
            , body =
                Http.jsonBody (jsonEncPostCommentRequest body)
            , expect =
                Http.expectJson toMsg jsonDecComment
            , timeout =
                Nothing
            , tracker =
                Nothing
            }

getApiComment : (Result Http.Error  ((List Comment))  -> msg) -> Cmd msg
getApiComment toMsg =
    let
        params =
            List.filterMap identity
            (List.concat
                [])
    in
        Http.request
            { method =
                "GET"
            , headers =
                []
            , url =
                Url.Builder.crossOrigin ""
                    [ "api"
                    , "comment"
                    ]
                    params
            , body =
                Http.emptyBody
            , expect =
                Http.expectJson toMsg (Json.Decode.list (jsonDecComment))
            , timeout =
                Nothing
            , tracker =
                Nothing
            }

postApiDocument : PostDocumentRequest -> (Result Http.Error  (Document)  -> msg) -> Cmd msg
postApiDocument body toMsg =
    let
        params =
            List.filterMap identity
            (List.concat
                [])
    in
        Http.request
            { method =
                "POST"
            , headers =
                []
            , url =
                Url.Builder.crossOrigin ""
                    [ "api"
                    , "document"
                    ]
                    params
            , body =
                Http.jsonBody (jsonEncPostDocumentRequest body)
            , expect =
                Http.expectJson toMsg jsonDecDocument
            , timeout =
                Nothing
            , tracker =
                Nothing
            }

getApiDocumentSearchByName : (Maybe String) -> String -> (Result Http.Error  ((List Document))  -> msg) -> Cmd msg
getApiDocumentSearchByName header_auth capture_name toMsg =
    let
        params =
            List.filterMap identity
            (List.concat
                [])
    in
        Http.request
            { method =
                "GET"
            , headers =
                List.filterMap identity
                    [ Maybe.map (Http.header "auth") header_auth
                    ]
            , url =
                Url.Builder.crossOrigin ""
                    [ "api"
                    , "document"
                    , "search"
                    , capture_name
                    ]
                    params
            , body =
                Http.emptyBody
            , expect =
                Http.expectJson toMsg (Json.Decode.list (jsonDecDocument))
            , timeout =
                Nothing
            , tracker =
                Nothing
            }

getApiDocumentAll : (Result Http.Error  ((List Document))  -> msg) -> Cmd msg
getApiDocumentAll toMsg =
    let
        params =
            List.filterMap identity
            (List.concat
                [])
    in
        Http.request
            { method =
                "GET"
            , headers =
                []
            , url =
                Url.Builder.crossOrigin ""
                    [ "api"
                    , "document"
                    , "all"
                    ]
                    params
            , body =
                Http.emptyBody
            , expect =
                Http.expectJson toMsg (Json.Decode.list (jsonDecDocument))
            , timeout =
                Nothing
            , tracker =
                Nothing
            }

getApiDocumentById : Int64 -> (Result Http.Error  ((Document, (List Comment)))  -> msg) -> Cmd msg
getApiDocumentById capture_id toMsg =
    let
        params =
            List.filterMap identity
            (List.concat
                [])
    in
        Http.request
            { method =
                "GET"
            , headers =
                []
            , url =
                Url.Builder.crossOrigin ""
                    [ "api"
                    , "document"
                    , capture_id |> String.fromInt
                    ]
                    params
            , body =
                Http.emptyBody
            , expect =
                Http.expectJson toMsg jsonDec(Document, (List Comment))
            , timeout =
                Nothing
            , tracker =
                Nothing
            }

getApiDocumentByIdComments : Int64 -> (Result Http.Error  ((List Comment))  -> msg) -> Cmd msg
getApiDocumentByIdComments capture_id toMsg =
    let
        params =
            List.filterMap identity
            (List.concat
                [])
    in
        Http.request
            { method =
                "GET"
            , headers =
                []
            , url =
                Url.Builder.crossOrigin ""
                    [ "api"
                    , "document"
                    , capture_id |> String.fromInt
                    , "comments"
                    ]
                    params
            , body =
                Http.emptyBody
            , expect =
                Http.expectJson toMsg (Json.Decode.list (jsonDecComment))
            , timeout =
                Nothing
            , tracker =
                Nothing
            }

getApiInfo : (Result Http.Error  (GetApiInfoResponse)  -> msg) -> Cmd msg
getApiInfo toMsg =
    let
        params =
            List.filterMap identity
            (List.concat
                [])
    in
        Http.request
            { method =
                "GET"
            , headers =
                []
            , url =
                Url.Builder.crossOrigin ""
                    [ "api"
                    , "info"
                    ]
                    params
            , body =
                Http.emptyBody
            , expect =
                Http.expectJson toMsg jsonDecGetApiInfoResponse
            , timeout =
                Nothing
            , tracker =
                Nothing
            }
