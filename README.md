# TODO

- TODO Add the missing screens for search, images, and news

- Add a visualization icon of who many user has seen my website (Firebase)

# Commands

`dart run build_runner build`


# Run locally with own server

`flutter run -d chrome --web-hostname 192.168.1.69 --web-port 8888`

# RG Portfolio

My portfolio is a collection of projects that I have worked on 😉.

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

## Testing

Context: One of my first apps to test.

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

Blog:
https://medium.com/flutter-community/bloc-testing-write-your-first-simple-unit-test-in-flutter-1eee1d1642aa


Library:
https://pub.dev/packages/bloc_test

# Useful

Cookbook: https://docs.flutter.dev/cookbook/navigation
Ref Navigator: https://api.flutter.dev/flutter/widgets/Navigator-class.html
Images in Flutter: https://docs.flutter.dev/development/platform-integration/web-images

Open the Chrome Console: Shift + CTRL + J (Windows)

[bloc]: https://bloclibrary.dev/#/
[font]: https://fonts.google.com/specimen/Readex+Pro?preview.text=Google&preview.text_type=custom#standard-styles
[reddit]: https://www.reddit.com/r/webdev/comments/pzq1bs/i_built_a_google_search_themed_portfolio_website/?utm_medium=android_app&utm_source=share
[google]: https://www.google.com/
[navigation]: https://docs.flutter.dev/development/ui/navigation
[icons]: https://icons8.com/

# Research

Maskable is for Android Icons.

Verify if should be used...

```json
    {
      "src": "icons/Icon-maskable-192.png",
      "sizes": "192x192",
      "type": "image/png",
      "purpose": "maskable"
    },
    {
      "src": "icons/Icon-maskable-512.png",
      "sizes": "512x512",
      "type": "image/png",
      "purpose": "maskable"
    }
```

<!--
    ReactJS source code: https://github.com/enjeck/gfolio
    Website: https://gfolio.enjeck.com/

    Yaml for custom views: https://github.com/gskinnerTeam/flutter-folio/blob/master/pubspec.yaml

    Adaptative screen:
        -  https://aloisdeniel.com/#/posts/adaptative-ui

        - https://docs.flutter.dev/development/ui/layout/building-adaptive-apps


    NOTE: Add a loading screen. Check the resouces below

    https://itnext.io/fix-flutter-web-loading-time-with-a-loading-spinner-c5dd36a29f5b

    https://github.com/flutter/flutter/issues/77936

    NOTE: Adaptative Responsive application
    https://docs.flutter.dev/development/ui/layout/adaptive-responsive

    NOTE: Know about the device in the web
    https://stackoverflow.com/a/67260733/10942018


    NOTE: To mantain this project public, please do not commit any private information or keys for the database and so on.
 -->
