#  README

A very simple feed reader for The New York Times.

It includes unit tests, dependency injection, centralized app configuration and a navigation facility to keep all components decoupled and fully testable.

All UI components are fully implemented in code (no .xib files or Interface Builder are used).

## Installation

Clone the project using the following command:

```bash
$ git clone https://github.com/jerosanchez/NYTFeedReader.git
```

The file `NYTFeedReader/Config/AppConfig+Secrets.swift` is missing for security reasons. In order to build and run the project you'll need to create the file manually with the following content:

```swift
import Foundation

extension AppConfig {
    struct Secrets {
        static var NYTApiKey = "YOUR_API_KEY"
    }
}
```

replacing `YOUR_API_KEY` with your own API KEY provided by NYT.

The project supports iOS 12+ and requires Xcode 11+ to build.

This project makes use of Cocoapods third-party dependencies, so you'll need to run the command `pod install`.

(To install Cocoapods, refer to: https://cocoapods.org)

## Dependencies

- SDWebImage: to download images asynchronously with a cache mechanism

## Usage

Set some conditions in the filter and tap Go.

Browse the articles list; whenever you see an article that appeals to you, tap on the corresponding row.

Enjoy reading the article directly from the NYT website inside the app.

## Architecture

The code base is organized in the following folders:

- `Assembly` - A simple dependency injection facility to keep all app components decoupled
- `Config` - A struct organized with extensions to keep a central place to setup key app behaviours 
- `Domain` - Domain models; for simplicity, we use the same models for both web services and the app (no mapper is used)
- `Helpers` - Some useful UIKit extensions and classes, and the Observable facility to build our MVVM architecture
- `Navigation` - A simple navigation mechanism to keep all scenes decoupled from each other
- `Repository` - The single access point to our data (either remote or local) so we don't need to couple scenes to the network layer 
- `Scene` - One subfolder per scene, each one including necessary controllers, subviews, view models, etc.
- `Service` - Gateway layer between our app and third-party frameworks so it's easy to exchange concrete implementations

The project also includes unit tests for the key components: domain models, helpers (not UIKit extensions) and repositories.

A note on file naming notation: a plus (+) sign in a file name means that it implements an extension of a base class. For example, `AppConfig.swift` implements the base class, and `AppConfig+Colors.swift` implements an extension of the class AppConfig to hold the colors configuration.

This technique is also used to implement the assembly and navigation facilities, as well as scene views and different UIKit component extensions.

## Improvements

Below are some possible improvements that can be tackled:

- Add unit tests for other components, like scenes
- Add a NYT Feed Reader app icon
