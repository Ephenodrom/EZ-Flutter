import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurveTween(curve: Curves.easeInOut).animate(_controller)
      ..addListener(
        () => setState(() => <String, void>{}),
      );
    _controller.repeat();
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
      children.add(widget.text);
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
