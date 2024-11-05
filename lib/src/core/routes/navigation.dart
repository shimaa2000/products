import 'package:flutter/material.dart';

import 'custom_page_route.dart';

final navigationKey = GlobalKey<NavigatorState>();

class CustomNavigator {
  CustomNavigator._singleTone();

  static final CustomNavigator _instance = CustomNavigator._singleTone();

  static CustomNavigator get instance => _instance;

  void pop({int numberOfPop = 1, dynamic result}) {
    for (int i = 0; i < numberOfPop; i++) {
      Navigator.pop(navigationKey.currentContext!, result);
    }
  }

  void popWithoutAnimation({int numberOfPop = 1, required Widget routeWidget}) {
    for (int i = 0; i < numberOfPop; i++) {
      Navigator.pop(
        navigationKey.currentContext!,
        PageRouteBuilder<dynamic>(
          pageBuilder: (BuildContext context, Animation<double> animation1,
                  Animation<double> animation2) =>
              routeWidget,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    }
  }

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) async {
    return Navigator.pushNamed(
      navigationKey.currentContext!,
      routeName,
      arguments: arguments,
    );
  }

  void pushNamedAndRemoveUntil(
      String routeName, bool Function(Route<dynamic> route) callback,
      {Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(
      navigationKey.currentContext!,
      routeName,
      callback,
      arguments: arguments,
    );
  }

  void pushAndRemoveUntil({
    required Widget routeWidget,
    required bool Function(Route<dynamic> route) callback,
  }) {
    Navigator.pushAndRemoveUntil(navigationKey.currentContext!,
        MaterialPageRoute<dynamic>(builder: (_) => routeWidget), callback);
  }

  void popAndPushNamed({required String routeName, Object? argument}) {
    Navigator.popAndPushNamed(navigationKey.currentContext!, routeName,
        arguments: argument);
  }

  void pushReplacementNamed(String routeName, {Object? argument}) {
    Navigator.pushReplacementNamed(navigationKey.currentContext!, routeName,
        arguments: argument);
  }

  Future<void> pushReplacement({
    required Widget routeWidget,
    Duration? duration,
    Duration? reverseDuration,
  }) async {
    await Navigator.pushReplacement(
      navigationKey.currentContext!,
      CustomPageRoute(
        child: routeWidget,
        forwardDuration: duration ?? const Duration(milliseconds: 500),
        backDuration: reverseDuration ?? const Duration(milliseconds: 500),
      ),
    );
  }

  Future<T> push<T>({
    required Widget routeWidget,
    Duration? duration,
    Duration? reverseDuration,
  }) async {
    return await Navigator.push(
      navigationKey.currentContext!,
      CustomPageRoute(
        child: routeWidget,
        forwardDuration: duration ?? const Duration(milliseconds: 500),
        backDuration: reverseDuration ?? const Duration(milliseconds: 500),
      ),
    );
  }

  void maybePop() {
    Navigator.maybePop(navigationKey.currentContext!);
  }

  void popUntil(
    bool Function(Route<dynamic> route) callback, {
    dynamic arguments,
  }) {
    Navigator.popUntil(
      navigationKey.currentContext!,
      callback,
    );
  }

  void pushReplacementWithoutAnimations({
    required Widget routeWidget,
  }) {
    Navigator.pushReplacement(
      navigationKey.currentContext!,
      PageRouteBuilder<dynamic>(
        pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) =>
            routeWidget,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  void pushReplacementNamedWithoutAnimations(
      {required String routeName, required Widget route}) {
    Navigator.pushReplacement(
      navigationKey.currentContext!,
      PageRouteBuilder<dynamic>(
        settings: RouteSettings(name: routeName),
        pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) =>
            route,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }
}
