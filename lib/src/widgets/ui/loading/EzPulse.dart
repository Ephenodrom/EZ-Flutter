import 'package:ez_flutter/src/bloc/ez_flutter_bloc.dart';
import 'package:flutter/material.dart';

///
/// A pulsing circle with some text.
///
class EzPulse extends StatefulWidget {
  EzPulse(
      {Key key,
      this.color,
      this.size = 50.0,
      this.duration = const Duration(seconds: 1),
      this.text})
      : assert(size != null),
        super(key: key);

  final Color color;
  final double size;
  final Duration duration;
  final Text text;

  @override
  _EzPulseState createState() => _EzPulseState();
}

class _EzPulseState extends State<EzPulse> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  Text text;

  @override
  void initState() {
    super.initState();

    text = widget.text;

    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurveTween(curve: Curves.easeInOut).animate(_controller)
      ..addListener(
        () => setState(() => <String, void>{}),
      );
    _controller.repeat();

    EzBlocProvider.of<EzGlobalBloc>(context)
        .get<EzLoadingBloc>(EzLoadingBloc)
        .messageStream
        .listen((msg) {
      if (msg != null) {
        setState(() {
          text = Text(
            msg,
            style: text.style,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: getChildren()));
  }

  List<Widget> getChildren() {
    List<Widget> children = [];
    children.add(getPulse());
    if (widget.text != null) {
      children.add(Padding(
          padding: EdgeInsets.symmetric(vertical: 8), child: widget.text));
    }
    return children;
  }

  Opacity getPulse() {
    return Opacity(
      opacity: 1.0 - _animation.value,
      child: Transform.scale(
        scale: _animation.value,
        child: SizedBox.fromSize(
          size: Size.square(widget.size),
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color != null
                  ? widget.color
                  : Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
