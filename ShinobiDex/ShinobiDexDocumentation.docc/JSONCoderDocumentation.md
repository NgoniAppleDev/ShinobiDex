# JSONCoder Design

A single source of truth for JSON encoding and decoding.

Instead of having different places creating a JSONDecoder, like this...
```
NetworkService
↓
JSONDecoder()
```

and
```
FixtureLoader
↓
JSONDecoder()
```

...whereby if the API team, for example, changes date to **ISO-8601** you'll need to update all the places the **JSONDecoder and JSONEncoder** are used.

## The Solution?

> We create something whose only responsibility is providing correctly configured decoders.

```swift
enum JSONCoding {

    static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()

        // any configurations goes here...

        return decoder
    }()

    static let encoder: JSONEncoder = {
        let encoder = JSONEncoder()

        return encoder
    }()
}
```

## So Now...

anywhere that needs **JSONDecoder** or **JSONEncoder**, they use:
```swift
JSONCoding.decoder.decode(...)
```
```swift
JSONCoding.encoder.encode(...)
```