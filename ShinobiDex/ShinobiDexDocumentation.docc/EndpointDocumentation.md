# Endpoint Design & Functionality

Think of Endpoint as a **description of a request**, not the request itself.


Instead of sprinkling URL strings throughout the app like this:

```swift
let url = URL(string: "https://dattebayo-api.onrender.com")!
```
we centralize everything.

This gives us three benefits:
- One place to change the API if the base URL changes.
- Easy to add new endpoints.
- Our NetworkService won't need to know anything about Naruto.

Endpoint is also responsible for constructing a request when your request is complicated like when you need to configure the HTTP method, headers or the body.

The NetworkService won't have to worry about headers or HTTP methods, effectively making Endpoint achieve **Encapsulation.**


## Why This Design Matters
The networking layer doesn't know anything about Naruto.
It only understands: "**Give me an Endpoint, and I'll execute it.**"

That means we can reuse this networking layer in:
- Weather app
- Banking app
- Spotify clone
- Movie database
- Github client

Or anything we may need it for.

The only thing that changes is the endpoint definitions.


## Adding the Base URL
```swift
extension Endpoint {
    static let baseURL = URL(string: "https://dattebayo-api.onrender.com")!
}
```

## Then we teach Endpoint how to create a URL
```swift
extension Endpoint {

    var url: URL? {
        var components = URLComponents(
            url: Self.baseURL,
            resolvingAgainstBaseURL: true
        )

        components?.path = path

        if !queryItems.isEmpty {
            components?.queryItems = queryItems
        }

        return components?.url
    }

}
```

## Now let's add a few endpoints
```swift
extension Endpoint {

    static let characters = Endpoint(
        path: "/characters"
    )
    
    static func character(id: Int) -> Endpoint {
        .init(path: "/characters/\(id)")
    }

}
```

## What we gain from this?

Without **Endpoint**:
```Plain text
ViewModel

↓

URL String

↓

Network
```

With **Endpoint**:
```Plain text
ViewModel

↓

Endpoint

↓

NetworkService

↓

URLSession
```

> This way, our ViewModel doesn't know what the URL looks like. It only says: "I want the **characters** endpoint."

This helps us have a cleaner separation of responsibilities.

## Need to add more endpoints in the future?
It's as simple as this:
```swift
extension Endpoint {

    static let clans = Endpoint(path: "/clans")

    static let villages = Endpoint(path: "/villages")

    static let jutsu = Endpoint(path: "/jutsu")

}
```

If an endpoint needs parameters:
```swift
static func character(id: Int) -> Endpoint {
    Endpoint(path: "/characters/\(id)")
}
```

Or, for a search endpoint:
```swift
static func searchCharacters(name: String) -> Endpoint {
    Endpoint(
        path: "/characters",
        queryItems: [
            URLQueryItem(name: "name", value: name)
        ]
    )
}
```

## See Also
- ``Endpoint``

