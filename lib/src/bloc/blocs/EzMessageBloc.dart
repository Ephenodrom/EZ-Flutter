import 'dart:async';

import 'package:ez_flutter/src/model/Message.dart';
import 'package:rxdart/rxdart.dart';

import '../BlocBase.dart';

class EzMessageBloc implements BlocBase {
  /// Sinks
  Sink<Message> get addition => messageAdditionController.sink;
  final messageAdditionController = StreamController<Message>();

  /// Streams
  Stream<Message> get messageStream => _message.stream;
  final _message = BehaviorSubject<Message>();

  EzMessageBloc() {
    messageAdditionController.stream.listen(handleMessageAdd);
  }

  ///
  /// Logic for message added .
  ///
  void handleMessageAdd(Message msg) {
    _message.add(msg);
    return;
  }

  @override
  void dispose() {
    messageAdditionController.close();
  }
}
