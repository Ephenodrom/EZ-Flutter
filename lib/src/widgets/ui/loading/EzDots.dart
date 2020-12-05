import 'package:ez_flutter/src/bloc/EzBlocProvider.dart';
import 'package:ez_flutter/src/bloc/EzGlobalBloc.dart';
import 'package:ez_flutter/src/bloc/blocs/EzLoadingBloc.dart';
import 'package:flutter/material.dart';

///
///
///
class EzDots extends StatefulWidget {
  final Duration duration;
  final bool isDot;
  final Color color;
  final Text text;

  EzDots(
      {this.duration = const Duration(milliseconds: 1000),
      this.isDot = true,
      this.text,
      this.color = Colors.blue});

  @override
  _EzDotsState createState() => _EzDotsState();
}

class _EzDotsState extends State<EzDots> with SingleTickerProviderStateMixin {
  Animation<double> ani1;
  Animation<double> ani2;
  Animation<double> ani3;
  AnimationController controller;
  Text text;

  @override
  void initState() {
    super.initState();

    text = widget.text;

    controller = AnimationController(duration: widget.duration);

    ani1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1, curve: Curves.ease),
      ),
    );

    ani2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.33, 1, curve: Curves.ease),
      ),
    );

    ani3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.66, 1, curve: Curves.ease),
      ),
    );

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat();

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
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: getChildren(),
    ));
  }

  List<Widget> getChildren() {
    List<Widget> children = [];
    children.add(getDots());
    if (widget.text != null) {
      children.add(
          Padding(padding: EdgeInsets.symmetric(vertical: 8), child: text));
    }
    return children;
  }

  Row getDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Opacity(
          opacity: ani1.value,
          child: Dot(radius: 10.0, color: widget.color, isDot: widget.isDot),
        ),
        Opacity(
          opacity: ani2.value,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Dot(radius: 10.0, color: widget.color, isDot: widget.isDot),
          ),
        ),
        Opacity(
          opacity: ani3.value,
          child: Dot(radius: 10.0, color: widget.color, isDot: widget.isDot),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;
  final bool isDot;
  final Icon icon;

  Dot({this.radius, this.color, this.isDot = true, this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(
        angle: 0,
        child: Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
              color: color,
              shape: isDot ? BoxShape.circle : BoxShape.rectangle),
        ),
      ),
    );
  }
}
