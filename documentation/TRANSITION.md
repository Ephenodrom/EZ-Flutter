# Transition

EZ Flutter provides a customizable loading screen to switch between to screens after some work is done.

## Table of Contents

1. [Basics](#basics)
2. [Usage](#usage)
   * [Transition from Screen A to B](#transition-from-screen-a-to-b)
3. [Build in loading widgets](#build-in-loading-widgets)

## Basics

Use the [EzTransition](/lib/src/widgets/EzTransition.dart) to switch from Screen A to B after some work is done. The "work" is defined by the **toProcess** argument.

## Usage

### Transition from Screen A to B

Create a method that does the **work** and use the Navigator to switch to the EzTransition Screen. Add a "loading" widget and the method as an argument.

```dart
void toProcess() async {
  await new Future.delayed(const Duration(seconds: 3));
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MyNewScreen(),
    ));
}

FlatButton(
  child: Text("Start transition"),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EzTransition(EzPulse(), toProcess,backgroundColor: Colors.white)),
    );
  },
)
```

## Build in loading widgets

EZ Flutter offers some loading animations that can be used for the [EzTransition](/lib/src/widgets/EzTransition.dart).

* [EzSpinner](/lib/src/widgets/loading/EzSpinner.dart)
* [EzPulse](/lib/src/widgets/loading/EzPulse.dart)
* [EzDots](/lib/src/widgets/loading/EzDots.dart)
