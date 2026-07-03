# NetworkService Design

The engine that powers everything else in the app.

This is where I will apply and implement the concepts at the core of what I learned in **Week 1: Swift Concurrency**:
- async / await
- throws
- Generic functions
- URLSession
- JSONDecoder
- HTTP response validation
- Swift error handling
- Reusable networking


## To have production code level
Instead of making NetworkService a concrete class that every view model instantiates directly, I defined a protocol first:
```swift
protocol NetworkServicing {
    func fetch<T: Decodable>(_ type: T.Type, from endpoint: Endpoint) async throws -> T
}
```

So we effectively end up with:
```
NetworkServicing (protocol)
          ▲
          │
NetworkService
```

**Why?**
- It makes the code easier to test by swapping in a mock implementation.
- It introduces dependency inversion early - a valuable architectural habit.
- It keeps the ViewModel decoupled from a specific networking implementation.

So, instead of saying, "**I need a NetworkService.**", the ViewModel says: "**I need something that knows how to fetch data.**"

That's what the protocol represents.


## Effectively, this design enables "dependency inversion"

```
NetworkServicing
        ▲
        │
NetworkService
```

For previews or tests:
```
NetworkServicing
        ▲
        │
MockNetworkService
```

or:
```
NetworkServicing
        ▲
        │
OfflineNetworkService
```

or:
```
NetworkServicing
        ▲
        │
CachedNetworkService
```

The ViewModel doesn't have to change at all. 
