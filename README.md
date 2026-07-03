# ShinobiDex App
An iOS app for Naruto Fans. I Built it to implement lessons I learned about Swift Concurrency.

## Stack
- Swift
- SwiftUI
- SwiftTesting

## Folder Structure
```
ShinobiDex
│
├── App
│
├── Views
│
├── ViewModels
│
├── Models
│
├── Services
│
├── Networking
│
├── Utilities
│
└── Resources
```

## Architecture

I used the MVVM architecture

```
View
    ↓
ViewModel
    ↓
NetworkService
    ↓
URLSession
    ↓
API
```
- Views never talk directly to the network.
- Views only communicate with ViewModels.
- ViewModels ask services for data.

## Models
- ShinobiCharacter
    - Family
    - Debut
    - PersonalInfo
        - AgeGroup
        - HeightGroup
        - WeightGroup
    - Rank
        - NijaRank
    - VoiceActor

![](assets/17830724893601.jpg)

