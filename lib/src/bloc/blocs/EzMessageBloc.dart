import 'dart:async';

import 'package:ez_flutter/src/model/EzMessage.dart';
import 'package:rxdart/rxdart.dart';

import '../EzBlocBase.dart';

///
/// Bloc that handles messages. Normally used by the [EzGlobalMessageWrapper].
///
class EzMessageBloc implements EzBlocBase {
  /// Sinks
  Sink<EzMessage> get addition => messageAdditionController.sink;
  final messageAdditionController = StreamController<EzMessage>();

  /// Streams
  Stream<EzMessage> get messageStream => _message.stream;
  final _message = BehaviorSubject<EzMessage>();

  EzMessageBloc() {
    messageAdditionController.stream.listen(handleMessageAdd);
  }

  ///
  /// Logic for message added.
  ///
  void handleMessageAdd(EzMessage msg) {
    _message.add(msg);
    return;
  }

  @override
  void dispose() {
    messageAdditionController.close();
  }
}
