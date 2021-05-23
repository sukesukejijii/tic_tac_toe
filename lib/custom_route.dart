import 'package:flutter/material.dart';

class CustomRoute extends MaterialPageRoute {
  CustomRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool fullscreenDialog = true,
  }) : super(
          builder: builder,
          settings: settings,
          fullscreenDialog: fullscreenDialog,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }

  @override
  Duration get transitionDuration => Duration(seconds: 1);
}
