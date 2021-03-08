# Space Launches

_Last revision: 8.2.2021_

## About the App
- Space Launches is an app which presents all the past Space-X launches and detail of every launch. User is able to search and sort list of launches. Caching of images is being used on the background for better user experience. Dark Mode is and landscape mode is supported.

- This app is written with [Combine](https://developer.apple.com/documentation/combine) and [SwiftUI](https://developer.apple.com/documentation/swiftui/).

**Project Support**:
- iPhone
- iOS 14+
- Swift 5
- Xcode 12+

## App Structure

### MVVM Architecture

- Used architecture is **MVVM** (Model-View-ViewModel). This architecture separates into three main groups:

`Models` hold application data. Contain data providers which call data using networking objects inside `API`.

`View models` transform models into values that can be displayed on a view. View model is responsible for business logic.

`Views` display controls and view elements on the screen. This project uses `SwiftUI` framework for view layer.

- Data to domain object mapping is used to separate Data layer and Domain layer of the application. Mapping is being done upon receiving data from `API` inside every data provider with `mapToDomain` functions.

### File Structure
- Scene specific logic is separated for every scene. For example logic specific for Launches list is inside `LaunchesList` and shared logic for all scenes can be found inside `Common`.

### Dependecy Injection
- Dependecy Injection (DI) is being used for data providers in view models so their protocols can be simply injected for possible future UnitTests implementation.
This is achieved by lighweight DI library [Resolver](https://github.com/hmlongco/Resolver).
- This library uses property wrappers often used in `SwiftUI` and is capable of injection of it's `ObservableObject`.
- Registering of dependencies is being done inside `AllServicesResolver`.

### Network Layer
- App uses well known [Alamofire](https://github.com/Alamofire/Alamofire) library.
- `Decodable` protocol with `CodingKey` is used for JSON decoding.

### Storage
- `UserDefaults` standard storage is used to store launches list sort methods.

## Dependency Management
- Generally I want to use as few dependencies as possible.
All dependencies are being handled by built in [Swift Package Manager](https://swift.org/package-manager).
[GitHub page](https://github.com/apple/swift-package-manager).
[Official manual](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).

### Used Dependencies
- You can view all dependencies in Project file -> Project -> Swift Packages (in the horizontal menu) or in `Swift Package Dependecies` at the end of the files structure.

- [Alamofire](https://github.com/Alamofire/Alamofire) - Networking.
- [Kingfisher](https://github.com/onevcat/Kingfisher) - Lightweight asynchronous image downloading and caching.
- [Resolver](https://github.com/hmlongco/Resolver) - Dependency Injection.

## Localization
- All Localizations can be found inside `LocalizationKit`. English is the only supported language.

## Changelog
- All notable changes to this project are documented in this file.
