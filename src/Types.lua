local Packages = script.Parent.Parent
local Fusion = require(Packages.Fusion)

export type DeconstructedRoute = {
    type: string,
    path: string,
    view: ({ any }) -> (Instance),
    meta: { [string]: any },
    [any]: any,
}

export type Route = {
    type: string,
    path: string,
    view: ({ any }) -> (Instance),
    [any]: any,
}

export type RouteParams = {
    view: ({ any }) -> (Instance),
    [any]: any,
}

export type Router = {
    type: string,
    history: {},
    serving: {
        path: Fusion.State,
        view: Fusion.State,
        meta: Fusion.State,
        params: { any },
    },
    routes: { DeconstructedRoute? },

    go: (Router, string, { any }) -> (),
    back: (Router, number?) -> (),
    set: (Router, DeconstructedRoute, { any }, string) -> (),
}

export type RouterParams = {
    routes: { Route },
}

export type CanvasParams = {
    Source: Router,
    PreRender: () -> ()?,
    PostRender: () -> ()?,
}

export type Koute = {
    _version: string,
    Route: (string) -> ((RouteParams) -> Route),
    Meta: (string) -> (Fusion.Symbol),
    Router: (RouterParams) -> (Router),
    Canvas: ({ Source: Router }) -> ( Frame ),
}

return {}