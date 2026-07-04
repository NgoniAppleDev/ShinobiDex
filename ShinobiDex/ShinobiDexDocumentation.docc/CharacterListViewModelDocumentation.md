# CharacterListViewModel Design

Answers: "How should the CharacterListView UI look like?"

It manages UI state.

## The architecture

```
RootView
      │
      ▼
CharacterListViewModel
      │
      ▼
CharacterRepository
      │
 ┌────┴──────────┐
 ▼               ▼
Remote      Fixture
      │
      ▼
NetworkService
      │
      ▼
URLSession
```

## By Utilizing the repositories, our `loadCharacters()` becomes so simple and elegant:
```swift
func loadCharacters() async {
        
        state = .loading
        
        do {
            let characters = try await repository.fetchCharacters()
            state = .loaded(characters)
        } catch {
            state = .failed(error)
        }
    }
```

The repository could be anything, as long as it conforms to the ``CharacterRepository`` protocol:
```swift
init(repository: CharacterRepository) {
        self.repository = repository
    }
```

## Convenient computed properties

```
State
 ↓
Computed Properties
```

State is the one source of truth.

Everything derives from it.

This is better design, rather than using stored properties which may need to be updated all the time, and we may forget.

So we end with computed properties like:
```swift
var characters: [ShinobiCharacter] {
        guard case .loaded(let characters) = state else {
            return []
        }

        return characters
    }
```

The notation...
```swift
guard case .loaded(let characters) = state else { ... }
```

...is called Pattern Matching. 

So is this:

```swift
var isLoading: Bool {
        if case .loading = state {
            return true
        }
        
        return false
    }
```

And this:
```swift
var error: Error? {
        guard case .failed(let error) = state else {
            return nil
        }

        return error
    }
```

## This is called Projection

The enum is your **domain state.**

The computed properties are a **projection** of that state into something the UI can consume easily.


## See Also
- ``CharacterRepository``
- ``FixtureCharacterRepository``
- ``RemoteCharacterRepository``
