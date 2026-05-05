%%% @doc Cowboy Swagger Handler.
%%%
%%%      Originally this module exposed the bundled Swagger UI under
%%%      `/api-docs/*' and a JSON spec under `/api-docs/swagger.json'.
%%%      Both were removed in 2.7.0-emqx3 to drop ~11 MB of static UI
%%%      assets from downstream releases (notably EMQX); consuming
%%%      applications now own the spec-serving HTTP routes themselves.
%%%
%%%      This module is kept (returning no trails) so that callers like
%%%      `minirest_trails' which still register
%%%      `{cowboy_swagger_handler, ...}' as a `trails_handler' continue
%%%      to compile and run unchanged.
-module(cowboy_swagger_handler).

%% Trails
-behaviour(trails_handler).

-export([trails/0, trails/1]).

-type route_match() :: '_' | iodata().

-export_type([route_match/0]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Trails
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-spec trails() -> trails:trails().
trails() ->
    trails(#{}).

-spec trails(map()) -> trails:trails().
trails(_Options) ->
    [].
