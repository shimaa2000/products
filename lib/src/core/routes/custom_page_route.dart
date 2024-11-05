// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomPageRoute<T> extends PageRoute<T> {
  final Widget child;
  final Duration? forwardDuration;
  final Duration? backDuration;
  CustomPageRoute({
    required this.child,
    this.forwardDuration,
    this.backDuration,
  });
  @override
  Color get barrierColor => Colors.transparent;

  @override
  String get barrierLabel => "";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration =>
      forwardDuration ?? const Duration(milliseconds: 500);
}
