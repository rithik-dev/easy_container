<!-- Pending release notes. The release workflow moves these into CHANGELOG.md under the new version heading, then clears this file. Write them for the people who use this package, using the same `* entry` bullet style as CHANGELOG.md. This file lives under .github/ so it never ships to pub.dev. -->

* Now requires Flutter `>=3.32.0` / Dart `>=3.8.0`. The pubspec previously declared `flutter: ">=1.17.0"`, but the widget has used `WidgetStateProperty` since v1.0.5, which needs Flutter 3.22+, so pub could install this package into SDKs where it would not compile. There is nothing to migrate: if you are on an older Flutter, pub keeps resolving you to 1.0.8 exactly as before.
* Reworked the example app to demonstrate borders, custom padding/margin, `alignment: null`, and the press-to-sink elevation, rather than a single container.
* Added a widget test suite covering rendering and gesture behaviour.
* Updated `flutter_lints` to `^6.0.0`, and dropped the unused `scripts:` block from `pubspec.yaml` now that releases are published by CI.
* Tidied the widget internals: `super` parameters, a public `createState` return type in place of the private one, and a single `Theme.of` lookup per build. No behaviour change.
