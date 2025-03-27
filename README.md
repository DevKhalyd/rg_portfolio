# TODO

- Replace Bloc by Riverpood (Normal and Generate code)
- Reactive programming using streams
- Repository pattern (clean architecture, repository layers)
- Widget Lifecycle
- How to verify the test coverage
- Update GiHub Image
- CI / CD => App Stores
- Isolates, block face id, shortcuts android, land iOS etc
- Tags in git (versioning code)
- Versioning apps in Android and iOS
- Refresh widget and animations like YouTube one
- Branch Model
- 1 DSA problem
- direct dependencies and transitive dependencies
- Fix the counter name
- Fix the HTML initialization
- Review the same design should be present from the old version
- Support multi-language
- Add rules to firebase
- Migrate to GoRouter
- See if the barrier works as expected in home
- Close the dialog if there is a navigation action
- Change URL Strategy
- Update the list of seach items by putting the selected item in purple color like chrome does when select a result
- Add the DarkTheme
- Mobile Web support
- Add a message called Inspiration and add the README file context
- Clock Project, migrate to rg portfolio as an animation project or just reference in the links using the Link widget (https://pub.dev/documentation/url_launcher/latest/link/Link-class.html)
- Migrate the past animated projects to this portfolio
- Add the new views at the initialization 

# Setup project

Create `firebase_options.dart` file

Reference:
https://firebase.google.com/docs/flutter/setup?hl=es-419&platform=web

# Before lauching new version do:

- Run the tests and if everything is ok, then launch the new version

# Commands

Build all the g files:

`dart run build_runner build --delete-conflicting-outputs`

# Run locally with own server`

`flutter run -d chrome --web-hostname 192.168.1.69 --web-port 8888`

## Inspiration

[Reddit]

Basically this user built a Google Search web site with the ReactJs framework.

When I saw this project I really wanted to copy but with Flutter for web.

So I built the Google Search portfolio [Google]

## Resources

[Font]: The main font
[Bloc]: The bloc library
[Icons]: The icons used

## Documentation

[Navigation] Basically in Flutter there is two ways to handle the navigation

## Riverpood Reference

All types of providers: https://riverpod.dev/docs/concepts/providers#different-types-of-providers

Combining Provider States: https://riverpod.dev/docs/concepts/combining_providers

Reading a Provider: https://riverpod.dev/docs/concepts/reading

## Providers most used

**Handle Repositories / Services / Classes**

[Provider]: Returns any type (A service class / computed property (filtered list))

**Handle UI State**

[StateProvider]: Returns any type	(A filter condition / **simple state object**)

[NotifierProvider]: Returns a subclass of (Async)Notifier	(A **complex state object** that is immutable except through an interface)

**Others**

- FutureProvider: Returns a Future of any type - A result from an API call
- StreamProvider: Returns a Stream of any type - A stream of results from an API

### Provider Modifiers

All Providers have a built-in way to add extra functionalities to your different providers.

At the moment, there are two modifiers available:

`.autoDispose`, which will make the provider automatically destroy its state when it is no longer being listened to.

`.family`, which allows creating a provider from external parameters.

Example:

```dart
final userProvider = FutureProvider.autoDispose.family<User, int>((ref, userId) async {
  return fetchUser(userId);
});
```

### Code Generation (New)

Improvements:

You may be wondering: "If code generation is optional in Riverpod, why use it?"

As always with packages: To make your life easier. This includes but is not limited to:

- Better syntax, more readable/flexible, and with a reduced learning curve.

- **No need to worry about the type of provider. Write your logic, and Riverpod will pick the most suitable provider for you.**

- The syntax no longer looks like we're defining a "dirty global variable". Instead we are defining a custom function/class.

- Passing parameters to providers is now unrestricted. Instead of being limited to using .family and passing a single positional parameter, you can now pass any parameter. This includes named parameters, optional ones, and even default values.

- Stateful hot-reload of the code written in Riverpod.

- Better debugging, through the generation of extra metadata that the debugger then picks up.

- Some Riverpod features will be available only with code generation.

New Syntax: https://riverpod.dev/docs/concepts/about_code_generation#the-syntax

## Testing

Simple put, test the main functions and the behavior like when add documentation

**Why I should testing?**

- Found bugs and fix them quickly and easily (E.G. After of add a new feature)
- Provide Docs by its own (Refer to the tests when u want to see how it works the code)
- Unit tests make better designs

**What to be tested with Higher Priority?**

- Collections passed as parameter not changed in the method (add(1,2),expected: 3)
- Algorithm Engines (Because if someone changes the algorithm it will break the app or an unexpected behavior)
- Utility methods
- Core business logic methods
- Simple DB queries checking predicates
- Services that are high-risk (E.G. Auth, Storage, Database, etc) (If the operation is too complex skip to Integration test)
- Exceptions

**What Not to Unit Test?**

- Complex DB queries
- Constructors or properties (if they just return variables). Test them only if they contain validations.
- Configurations like constants, readonly fields, configs, enumerations, etc.
- Facades of just wrapping other frameworks or libraries
- Complex multi-threading code (it is better to be tested with integration tests)
- Methods that call another public method
- Exception messages
- POCO classes — models, etc.

Ref: https://dzone.com/articles/unit-testing-guidelines-what-to-test-and-what-not

**For Flutter:**

- A unit test tests a single function, method, or class.
- A widget test (in other UI frameworks referred to as component test) tests a single widget.
- An integration test tests a complete app or a large part of an app.

**Mock dependencies using Mockito**

Mock: A mock is a substitute for a real object. Help to test an expected behavior of a real object.

- A passing test might start failing if a web service or database returns unexpected results. This is known as a “flaky test.”

Bloc Test:

Library:
https://pub.dev/packages/bloc_test

Blog:
https://medium.com/flutter-community/bloc-testing-write-your-first-simple-unit-test-in-flutter-1eee1d1642aa

Img: https://miro.medium.com/max/1400/1*uh0oxixcra7RFnJ15tc4Yg.png

Official Documentation:
https://bloclibrary.dev/#/testing

Example of a fully tested application:

https://github.com/felangel/bloc/tree/master/examples/flutter_weather/test

# Useful

Cookbook: https://docs.flutter.dev/cookbook/navigation
Ref Navigator: https://api.flutter.dev/flutter/widgets/Navigator-class.html
Images in Flutter: https://docs.flutter.dev/development/platform-integration/web-images

Open the Chrome Console: Shift + CTRL + J (Windows)

[Provider]: https://riverpod.dev/docs/providers/provider
[StateProvider]: https://riverpod.dev/docs/providers/state_provider
[NotifierProvider]: https://riverpod.dev/docs/providers/notifier_provider

[bloc]: https://bloclibrary.dev/#/
[font]: https://fonts.google.com/specimen/Readex+Pro?preview.text=Google&preview.text_type=custom#standard-styles
[reddit]: https://www.reddit.com/r/webdev/comments/pzq1bs/i_built_a_google_search_themed_portfolio_website/?utm_medium=android_app&utm_source=share
[google]: https://www.google.com/
[navigation]: https://docs.flutter.dev/development/ui/navigation
[icons]: https://icons8.com/

# Widgets

IntrinsicHeight: (A widget that sizes its child to the child's intrinsic height.)
https://api.flutter.dev/flutter/widgets/IntrinsicHeight-class.html
