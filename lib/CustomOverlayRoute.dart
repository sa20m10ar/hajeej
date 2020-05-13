import 'package:flutter/material.dart';

class CustomOverlayRoute extends ModalRoute<void> {
  Widget page;
  CustomOverlayRoute({@required this.page,});
  @override
  Duration get transitionDuration => Duration(milliseconds: 1);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => false;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: page,
      ),
    );
  }


  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,alwaysIncludeSemantics: false,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}