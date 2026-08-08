## 1.2.1 - 2026-08-08

* Added a screenshot to the package listing, so pub.dev now shows a thumbnail in search results and a gallery on the package page.
* README: added a short section on what `EasyContainer` actually saves you, next to nesting `Card`, `InkWell` and `Padding` by hand.
* README: dropped a badge that had stopped rendering, swapped in monthly downloads, and added links to the author's portfolio and other packages.
* README: the screenshots are now served from this repository instead of GitHub's attachment CDN, which was outside the repo's control and could have gone stale.

## 1.2.0 - 2026-08-08

* Regenerated the example app's Android project for Flutter 3.44. It was still on the 3.24 scaffolding, pinned to Gradle 8.3, so running the example on Android failed with "Your project's Gradle version (8.3.0) is lower than Flutter's minimum supported version of 8.7.0". It now uses Gradle 9.1, AGP 9 and the Kotlin build DSL. The package itself is unchanged.

## 1.1.1 - 2026-08-07

* Maintenance release; no user-facing changes.

## 1.1.0 - 2026-08-04

* Now requires Flutter `>=3.32.0` / Dart `>=3.8.0`. The pubspec previously declared `flutter: ">=1.17.0"`, but the widget has used `WidgetStateProperty` since v1.0.5, which needs Flutter 3.22+, so pub could install this package into SDKs where it would not compile. There is nothing to migrate: if you are on an older Flutter, pub keeps resolving you to 1.0.8 exactly as before.
* Reworked the example app to demonstrate borders, custom padding/margin, `alignment: null`, and the press-to-sink elevation, rather than a single container.
* Added a widget test suite covering rendering and gesture behaviour.
* Updated `flutter_lints` to `^6.0.0`, and dropped the unused `scripts:` block from `pubspec.yaml` now that releases are published by CI.
* Tidied the widget internals: `super` parameters, a public `createState` return type in place of the private one, and a single `Theme.of` lookup per build. No behaviour change.

## 1.0.8 - 2026-07-28

* Maintenance release; no user-facing changes.

## 1.0.7 - 2026-07-27

* Maintenance release; no user-facing changes.

## 1.0.6 - 2026-07-27

* Added GitHub Actions CI to automate version bumps, changelog updates, tagging and pub.dev publishing.

## 1.0.5+1 - 2025-02-23

* **BREAKING:** Made `enableFeedback` non nullable as per Flutter v3.29.0 [CHANGELOG](https://docs.flutter.dev/release/release-notes/release-notes-3.29.0#:~:text=Fix:%20The%20enableFeedback%20property%20of%20InkWell%20cannot%20be%20set%20to%20a%20nullab…%20by%20@StanleyCocos%20in%20158907). (PR [#158907](https://github.com/flutter/flutter/pull/158907))

## 1.0.5 - 2024-09-28

* Added android and ios example apps
* Updated README

## 1.0.4+1 - 2023-03-18

* Added issue tracker link
* Updated README badges

## 1.0.4 - 2022-06-07

* Fixed linter issues

## 1.0.3 - 2022-02-07

* Updated default card color

## 1.0.2 - 2022-01-26

* Updated license
* Updated README.md

## 1.0.1 - 2022-01-26

* Added linter and updated code accordingly
* Updated example app
* Updated README.md

## 1.0.0 - 2021-11-05

* Updated default elevation to 1.5

## 0.0.9 - 2021-09-09

* Synced with flutter 2.5 (accentColor deprecated)

## 0.0.8 - 2021-05-26

* Updated README.md

## 0.0.7 - 2021-05-26

* Updated README.md
* Updated example app

## 0.0.6 - 2021-05-12

* Removed pubspec.yaml comments

## 0.0.5 - 2021-05-12

* Fixed key parameter

## 0.0.4 - 2021-04-20

* No need to hot restart to see changes in elevation
* Updated README.md

## 0.0.3 - 2021-04-17

* Added custom parameters to padding, margin, border radius and shorthands for the same
* Added alignment parameter to align the child in center by default.
* Added showBorder to enable/disable border.
* Updated README.md

## 0.0.2 - 2021-04-13

* Added more parameters hence increasing the customizability.

## 0.0.1 - 2021-04-13

* An easy to use container for flutter with in built gesture detectors and a lot of customization.
