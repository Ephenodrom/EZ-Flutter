import 'package:basic_utils/basic_utils.dart';
import 'package:ez_flutter/src/bloc/EzGlobalBloc.dart';
import 'package:ez_flutter/src/bloc/blocs/EzMessageBloc.dart';
import 'package:ez_flutter/src/bloc/ez_flutter_bloc.dart';
import 'package:ez_flutter/src/model/EzMessage.dart';
import 'package:ez_flutter/src/model/EzMessageType.dart';
import 'package:ez_flutter/src/model/EzSettings.dart';
import 'package:ez_flutter/src/model/EzSettingsKeys.dart';
import 'package:flutter/material.dart';

///
/// Widget for displaying messages to a user.
///
/// Add it directly under the scaffold to display messages arrive through the messageStream of the [EzMessageBloc].
/// The wrapper supports four types of messages :
/// * [EzMessageType.SUCCESS] (Colors.green)
/// * [EzMessageType.INFO] (Colors.blue)
/// * [EzMessageType.WARNING] (Colors.orange)
/// * [EzMessageType.ERROR] (Colors.red)
/// * [EzMessageType.DEBUG] (Colors.grey)
///
/// The color used for a type can be modified via the application.json file under assets using the following keys:
/// * msg_success_color
/// * msg_info_color
/// * msg_warning_color
/// * msg_error_color
/// * msg_debug_color
///
/// See [EzSettingsKeys] for all possible configuration keys.
///
class EzGlobalMessageWrapper extends StatefulWidget {
  final Widget child;

  EzGlobalMessageWrapper(this.child);
  @override
  _EzGlobalMessageWrapperState createState() => _EzGlobalMessageWrapperState();
}

class _EzGlobalMessageWrapperState extends State<EzGlobalMessageWrapper> {
  @override
  void initState() {
    super.initState();
    EzBlocProvider.of<EzGlobalBloc>(context)
        .get<EzMessageBloc>(EzMessageBloc)
        .messageStream
        .listen((msg) {
      if (msg != null) {
        _showMessage(msg);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showMessage(EzMessage message) {
    Color color = Colors.grey;

    switch (message.type) {
      case EzMessageType.SUCCESS:
        if (EzSettings.app() != null) {
          if (StringUtils.isNotNullOrEmpty(
              EzSettings.app()[EzSettingsKeys.KEY_MSG_SUCCESS_COLOR])) {
            color =
                Color(EzSettings.app()[EzSettingsKeys.KEY_MSG_SUCCESS_COLOR]);
          } else {
            color = Colors.green;
          }
        } else {
          color = Colors.green;
        }
        break;
      case EzMessageType.INFO:
        if (EzSettings.app() != null) {
          if (StringUtils.isNotNullOrEmpty(
              EzSettings.app()[EzSettingsKeys.KEY_MSG_INFO_COLOR])) {
            color = Color(EzSettings.app()[EzSettingsKeys.KEY_MSG_INFO_COLOR]);
          } else {
            color = Colors.blue;
          }
        } else {
          color = Colors.blue;
        }
        break;
      case EzMessageType.WARNING:
        if (EzSettings.app() != null) {
          if (StringUtils.isNotNullOrEmpty(
              EzSettings.app()[EzSettingsKeys.KEY_MSG_WARNING_COLOR])) {
            color =
                Color(EzSettings.app()[EzSettingsKeys.KEY_MSG_WARNING_COLOR]);
          } else {
            color = Colors.orange;
          }
        } else {
          color = Colors.orange;
        }
        break;
      case EzMessageType.ERROR:
        if (EzSettings.app() != null) {
          if (StringUtils.isNotNullOrEmpty(
              EzSettings.app()[EzSettingsKeys.KEY_MSG_ERROR_COLOR])) {
            color = Color(EzSettings.app()[EzSettingsKeys.KEY_MSG_ERROR_COLOR]);
          } else {
            color = Colors.red;
          }
        } else {
          color = Colors.red;
        }
        break;
      case EzMessageType.DEBUG:
        if (EzSettings.app() != null) {
          if (StringUtils.isNotNullOrEmpty(
              EzSettings.app()[EzSettingsKeys.KEY_MSG_DEBUG_COLOR])) {
            color = Color(EzSettings.app()[EzSettingsKeys.KEY_MSG_DEBUG_COLOR]);
          } else {
            color = Colors.grey;
          }
        } else {
          color = Colors.grey;
        }
        break;
      default:
    }

    SnackBar bar =
        SnackBar(content: Text(message.text), backgroundColor: color);

    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(bar);
    message.displayed = true;
  }
}
