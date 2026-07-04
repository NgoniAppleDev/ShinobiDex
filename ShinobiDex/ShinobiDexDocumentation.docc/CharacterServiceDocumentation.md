# CharacterService Design

Stands between ViewModels and the NetworkService.

The ViewModel shouldn't know about endpoints.

The architecture becomes:

```
┌──────────────────────────┐
│        ViewModel         │
└────────────┬─────────────┘
             │
             ▼
┌──────────────────────────┐
│     CharacterService     │
└────────────┬─────────────┘
             │
             ▼
┌──────────────────────────┐
│     NetworkService       │
└────────────┬─────────────┘
             │
             ▼
┌──────────────────────────┐
│      URLSession          │
└──────────────────────────┘
```

Each layer knows less than the one above it.

Now the ViewModel simply asks: "**Give me the characters.**"
It doesn't know--or care--how that happens.

## Think of Layers as Experts

### ViewModel
Knows: "I need characters."

It doesn't know:
- URLs
- JSON
- HTTP
- URLSession

### CharacterService
Knows: "Characters come from the **/characters** endpoint.

It doesn't know:
- SwiftUI
- Views
- ProgressViews

### NetworkService
Knows: "Give me any endpoint and I'll return any Decodable model."

It doesn't know:
- Naruto
- Villages
- Jutsu
- Shinobi


This separation makes software **Scalable.**


## CharacterServicing Protocol

```swift
import Foundation

protocol CharacterServicing {
    func fetchCharacters() async throws -> [ShinobiCharacter]
}
```

This protocol is **domain-specific.**

``NetworkServicing`` speaks in terms of generic requests and endpoints.

**CharacterServicing** speaks the language of your app:
- Characters
- Villages
- Clans
- Jutsu

## Dependency Injection

Instead of **CharacterServicing** creating its own **NetworkService** internally:
```swift
private let networkService = NetworkService()
```

it injects it:
```swift
init(networkService: NetworkServicing)
```

This keeps **CharacterServicing** independent of the concrete networking implementation and makes it easier to test or swap implementations later.

It's the same pattern we did with ``NetworkServicing``, and it keeps the architecture consistent as the app grows.


## The Response We Get

The response is not a plain array. It is a paginated object containing metadata and actual characters.

It looks like this (simplified and shortened):
```JSON
{
  "characters": [
    {
      "id": 1,
      "name": "...",
      ...
    }
  ],
  "currentPage": 1,
  "pageSize": 20,
  "total": 143
}
```

So I designed ``CharacterResponse`` to be like this:
```swift
struct CharacterResponse: Codable, Sendable {
    let characters: [ShinobiCharacter]
    let currentPage: Int
    let pageSize: Int
    let total: Int
}
```

so that out networking layer decodes exactly what the server sends.


Now when we implement the ``CharacterServicing`` `fetchCharacters()` method inside **CharacterService**, it looks like this:
```swift
func fetchCharacters() async throws -> [ShinobiCharacter] {

    let response = try await networkService.fetch(
        CharacterResponse.self,
        from: .characters
    )

    return response.characters
}
```

The ViewModel still gets `[ShinobiCharacter]`

It never learns about
- page size
- current page
- total records

Those are API details. The service hides them.
