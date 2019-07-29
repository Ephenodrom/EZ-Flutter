import 'package:ez_flutter/src/bloc/EzGlobalBloc.dart';
import 'package:ez_flutter/src/bloc/blocs/EzMessageBloc.dart';
import 'package:ez_flutter/src/bloc/ez_flutter_bloc.dart';
import 'package:ez_flutter/src/model/EzMessage.dart';
import 'package:ez_flutter/src/model/EzSettings.dart';
import 'package:ez_flutter/src/model/EzSettingsKeys.dart';
import 'package:flutter/material.dart';

class GlobalMessageWrapper extends StatefulWidget {
  final Widget child;

  GlobalMessageWrapper(this.child);
  @override
  _GlobalMessageWrapperState createState() => _GlobalMessageWrapperState();
}

class _GlobalMessageWrapperState extends State<GlobalMessageWrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: null,
        stream: EzBlocProvider.of<EzGlobalBloc>(context)
            .get<EzMessageBloc>(EzMessageBloc)
            .messageStream,
        builder: (BuildContext context, AsyncSnapshot<EzMessage> snapshot) {
          EzMessage msg = snapshot.data;
          if (msg != null) {
            WidgetsBinding.instance
                .addPostFrameCallback((_) => _showMessage(msg));
          }
          return Container(child: widget.child);
        });
  }

  void _showMessage(EzMessage message) {
    Color color = Colors.grey;

    switch (message.type) {
      case "success":
        color = EzSettings.app()[EzSettingsKeys.KEY_MSG_SUCCESS_COLOR] != null
            ? Color(EzSettings.app()[EzSettingsKeys.KEY_MSG_SUCCESS_COLOR])
            : Colors.green;

        break;
      case "info":
        color = EzSettings.app()[EzSettingsKeys.KEY_MSG_INFO_COLOR] != null
            ? Color(EzSettings.app()[EzSettingsKeys.KEY_MSG_INFO_COLOR])
            : Colors.blue;
        break;
      case "warning":
        color = EzSettings.app()[EzSettingsKeys.KEY_MSG_WARNING_COLOR] != null
            ? Color(EzSettings.app()[EzSettingsKeys.KEY_MSG_WARNING_COLOR])
            : Colors.orange;
        break;
      case "error":
        color = EzSettings.app()[EzSettingsKeys.KEY_MSG_ERROR_COLOR] != null
            ? Color(EzSettings.app()[EzSettingsKeys.KEY_MSG_ERROR_COLOR])
            : Colors.red;
        break;
      default:
    }

    //Flushbar(
    //  message: message.text,
    //  backgroundColor: color,
    //  duration: Duration(seconds: 3),
    //)..show(context);

    SnackBar bar =
        SnackBar(content: Text(message.text), backgroundColor: color);

    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(bar);
  }
}
