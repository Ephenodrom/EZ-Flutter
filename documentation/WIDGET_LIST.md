# Widgets

EZ Flutter provides a lot of ready to use widgets.

## List

1. [EzScaffold / EzGradientScaffold](#ezscaffold-/-ezgradientscaffold)
2. [EzTransition](#eztransition)
3. [EzGlobalMessageWrapper](#ezglobalmessagewrapper)
4. [EzDots](#ezdots)
5. [EzSpinner](#ezspinner)
6. [EzPulse](#ezpulse)

## EzScaffold / EzGradientScaffold

[EzScaffold](/lib/src/widgets/EzScaffold.dart) is a wrapper for the Scaffold Widget. The body of the Scaffold is wrapped with [EzGlobalMessageWrapper](/lib/src/widgets/EzGlobalMessageWrapper.dart) to activate the global messaging feature.

[EzGradientScaffold](/lib/src/widgets/EzGradientScaffold.dart) is a  Wrapper for the Scaffold with gradient background. The scaffold ist wrapped inside a Container with Boxdecoration and gradient set to the given Gradient. The EzGradientScaffold has the same arguments as the Scaffold.
The body of the Scaffold is wrapped with [EzGlobalMessageWrapper](/lib/src/widgets/EzGlobalMessageWrapper.dart) to activate the global messaging feature.

## EzTransition

[EzTransition](/lib/src/widgets/EzTransition.dart) is a Widget for displaying loading animation and doing background work at the same time.

## EzGlobalMessageWrapper

[EzGlobalMessageWrapper](/lib/src/widgets/EzGlobalMessageWrapper.dart) is a widget for displaying messages to a user. The wrapper supports four [types](lib/src/model/EzMessageType.dart) of messages :

* SUCCESS (default color : Colors.green)
* INFO (default color : Colors.blue)
* WARNING (default color : Colors.orange)
* ERROR (default color : Colors.red)
* DEBUG (default color : Colors.grey)

## EzDots

[EzDots](/lib/src/widgets/loading/EzDots.dart) is a simple loading animation with jumping dots/squares and some text.

## EzSpinner

[EzSpinner](/lib/src/widgets/loading/EzSpinner.dart) is a simple loading animation with a normal spinner and some text.

## EzPulse

[EzPulse](/lib/src/widgets/loading/EzPulse.dart) is a simple loading animation with a pulsing circle and some text.
