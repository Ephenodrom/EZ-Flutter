# Global Messaging

EZ Flutter supports displaying a message to the user from anywhere inside the app with just one line of code.

## Table of Contents

1. [Basics](#basics)
2. [Usage](#start-an-ez-flutter-app)
   * [Use build in Scaffolds](#use-buildin-scaffolds)
   * [Add the message wrapper](#add-the-message-wrapper)
   * [Add message to the bloc](#add-message-to-the-bloc)
3. [Customize message colors](#customize-message-colors)

## Basics

Global Messaging is handled with a BLOC and widget added as the body of a Scaffold.

## Usage

### Use build in Scaffolds

To activate the Global Messaging feature, you can use the build in scaffolds.

* [EzScaffold](/lib/src/widgets/EzScaffold.dart)
* [EzGradientScaffold](/lib/src/widgets/EzGradientScaffold.dart)

If you don't want to use the build in scaffold widgets, check out the next steps!

### Add the message wrapper

Add the [EzGlobalMessageWrapper](/lib/src/widgets/EzGlobalMessageWrapper.dart) as the body to a Scaffold.

```dart
Scaffold{
  appBar: ...
  body: EzGlobalMessageWrapper(
    MyWidget(
      ...
    )
  )
}
```

### Add message to the bloc

Load the [EzMessageBloc](/lib/src/bloc/blocs/EzMessageBloc.dart) via the [EzBlocProvider](/lib/src/bloc/EzBlocProvider.dart) using the **get** method.

Add a [EzMessage](/lib/src/model/EzMessage.dart) to the bloc. The supported [EzMessageTypes](/lib/src/model/EzMessageType.dart) are :

* SUCCESS (default color : Colors.green)
* INFO (default color : Colors.blue)
* WARNING (default color : Colors.orange)
* ERROR (default color : Colors.red)

```dart
    EzBlocProvider.of<EzGlobalBloc>(context)
        .get<EzMessageBloc>(EzMessageBloc)
        .addition
        .add(EzMessage("This is a success message", EzMessageType.SUCCESS));
```

## Customize message colors

It is also possible to customize the color for each type of message within the **ez_settings.json** file.

```json
{
  "msg_success_color" : "0xFF1B5E20",
  "msg_info_color" : "0xFF0D47A1",
  "msg_warning_color" : "0xFFE65100",
  "msg_error_color" : "0xFFB71C1C",
}
```
