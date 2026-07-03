# FixtureLoader Design

Loads static data from local file for use during development.

It is build in exactly 4 steps:
```
Locate file
      ↓
Read Data
      ↓
Decode JSON
      ↓
Return generic model
```

Compare it to NetworkService:
```
Build request
      ↓
Download Data
      ↓
Decode JSON
      ↓
Return generic model
```

They're almost the same pipeline!

The only difference is **where the bytes come from:**
- ``NetworkService`` -> Internet 🌐
- FixtureLoader -> Bundle 📁

Everything after that is identical.

## So it's implemented like this:
- Find the file in the bundle.
- Read its data.
- Decode it into any Decodable & Sendable type.
- Return the model.
- Throw meaningful ``FixtureError`` when something goes wrong.


## Intentinal API Design
Our FixtureLoader static `load(_:named:)` function:
```swift
static func load<T: Decodable & Sendable>(
    _ type: T.Type,
    named fileName: String
) throws -> T {
    ...
}
```

Now when calling this method:
```swift
try FixtureLoader.load(
    CharacterResponse.self,
    named: "CharactersPage1"
)
```

Compare to when calling the `fetch(_:from:)` method on our network:
```swift
try await networkService.fetch(
    CharacterResponse.self,
    from: .characters
)
```

Compare again, the data loading with ``NetworkService``:

FixtureLoader:
```swift
do {
    data = try Data(contentsOf: url)
} catch {
    throw FixtureError.failedToLoadData(error)
}
```

NetworkService:
```swift
do {
    (data, response) = try await session.data(for: request)
} catch {
    throw APIError.network(error)
}
```


## But Why is the `load` method not async?

The network layer does this:
```
Internet
      ↓
URLSession
      ↓
await
```

But, loading from the app bundle is simply reading a local file.

There's no network request.

No waiting on a server.


## Why use Enum for FixtureLoader?

- Does Fixture have state? - **No**
- Does it remember anything? - **No**
- Does it need to be instantiated? - **No**

### Why not a class?
- A class implies, "This object has identity and may own state."
- A fixture loader doesn't.

### Why not a struct?
- A struct is great when you have values.
- That's data.
- FixtureLoader isn't data.

### Why Enum?

Swift developer often use an enum with no cases as a namespace.
```swift
enum FixtureLoader {

    static func load(...)
}
```
Nobody can accidentally do this:
```swift
FixtureLoader()
```
because enums without cases can't be instantiated.

That's the compiler helping us to express intent.



## See Also
- ``FixtureLoader``
