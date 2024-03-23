# login_sample_app

## Requirement

- Flutter SDK 3.10.5
- Dart 3.0.5
- Visual Studio Code
- Android Studio

## State management

- Riverpod 2.0

## Local database

- Hive

## How to generate translated message code

```
  flutter pub run intl_utils:generate
```

- Now, you can get the localized text by `L10n.current.xxxx`

## How to generate the code and path icon

```
  flutter pub run build_runner build --delete-conflicting-outputs
```

- Now, you can get path icon from folder svg by `Assets.svg.icon.path`

## How to run

- Debug

  ```cmd
  flutter run --debug --flavor development -t lib/env/main_development.dart 
  flutter run --debug --flavor stagging -t lib/env/main_stagging.dart 
  flutter run --debug --flavor production -t lib/env/main_production.dart
  ```

- Release

  ```cmd
  flutter run --release --flavor development -t lib/env/main_development.dart 
  flutter run --release --flavor stagging -t lib/env/main_stagging.dart 
  flutter run --release --flavor production -t lib/env/main_production.dart
  ```

## How to build

### Android

```shell script
  flutter build apk --debug -t lib/env/main_development.dart
  flutter build apk --debug -t lib/env/main_staging.dart
  flutter build apk --debug -t lib/env/main_production.dart
  
  flutter build appbundle --flavor production -t lib/env/main_production.dart
  flutter build appbundle --flavor development -t lib/env/main_development.dart
    flutter build appbundle --flavor stagging -t lib/env/main_stagging.dart
```

