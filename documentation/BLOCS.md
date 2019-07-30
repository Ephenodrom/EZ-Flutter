# Blocs

EZ Flutter has some buildin Blocs that can be used inside you app.

## Table of Contents

1. [Basics](#basics)
2. [Usage](#usage)
   * [Access Blocs](#access-blocs)
   * [Add custom Blocs](#add-custom-blocs)

## Basics

EZ Flutter offers the following blocs :

* [EzMessageBloc](/lib/src/bloc/blocs/EzMessageBloc.dart)

## Usage

### Access Blocs

Access each Bloc via the [EzGlobalBloc](/lib/src/bloc/EzGlobalBloc.dart) using the **get** method. The **get** method uses the runtime type of the class.

```dart
EzBlocProvider.of<EzGlobalBloc>(context)
      .get<EzMessageBloc>(EzMessageBloc);
```

### Add custom Blocs

Typically your app will use some blocs written by yourself. EZ Flutter supports adding custom blocs to the [EzGlobalBloc](/lib/src/bloc/EzGlobalBloc.dart).

The [EzRunner](/lib/src/ez_runner.dart) will add the given **blocs** to the [EzGlobalBloc](/lib/src/bloc/EzGlobalBloc.dart) at startup. You can access each bloc everywhere inside the app.

```dart
Map<Type, EzBlocBase> blocs = {
  MyCustomBloc, MyCustomBloc()
}

void main(){
  EzRunner.run(MyHomePage(title: 'Hello EZ'), blocs : blocs);
}
```

Your Bloc has to extend [EzBlocBase](/lib/src/bloc/EzBlocBase.dart).

```dart
class MyCustomBloc extends BlocBase {
  // some stuff
}
```
