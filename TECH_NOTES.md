Architecture Overview

lib/
├── domain/      
│   ├── business_model.dart
│   └── business_repository.dart
├── data/          
│   └── business_repository_impl.dart
├── presentation/   
│   ├── business_notifier.dart
│   └── business_screen.dart


Domain Layer: Defines models and repository contracts.

Data Layer: Implements repositories and can handles API/data source integration.

Presentation Layer → Uses Provider + ChangeNotifier for UI state management.

Future Improvements:

- Add tests.
- Replace Object? errors with a strongly typed Failure model including codes and messages.
- Offline-First Support, add caching so businesses can be fetched offline.
