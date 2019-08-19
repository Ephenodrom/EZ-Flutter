import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../EzBlocBase.dart';

///
/// Bloc that handles loading messages. Normally used by loading widgets like [EzPulse], [EzDots], [EzSpinner].
///
class EzLoadingBloc implements EzBlocBase {
  /// Sinks
  Sink<String> get addition => messageAdditionController.sink;
  final messageAdditionController = StreamController<String>();

  /// Streams
  Stream<String> get messageStream => _message.stream;
  final _message = BehaviorSubject<String>();

  EzLoadingBloc() {
    messageAdditionController.stream.listen(handleMessageAdd);
  }

  ///
  /// Logic for message added.
  ///
  void handleMessageAdd(String msg) {
    _message.add(msg);
    return;
  }

  @override
  void dispose() {
    messageAdditionController.close();
  }
}
