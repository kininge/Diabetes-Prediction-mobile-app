import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget
{
  final double delay;
  final Widget child;

  const FadeAnimation(this.delay, this.child);

  @override 
  Widget build(BuildContext context)
  {
    final ourTween= MultiTrackTween
    ([
      Track("opacity").add(Duration(microseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(Duration(microseconds: 500), Tween(begin: -130.0, end: 0.0), curve: Curves.easeOut),
    ]);

    return ControlledAnimation
    (
      delay: Duration(milliseconds: (500* delay).round()),
      duration: ourTween.duration,
      tween: ourTween,
      child: child,
      builderWithChild: (BuildContext context, Widget child, dynamic animation)
      {
        return AnimatedOpacity
        (
          opacity: animation["opacity"], 
          duration: Duration(microseconds: 500),
          child: child,
        );
      },
    );
  }
}