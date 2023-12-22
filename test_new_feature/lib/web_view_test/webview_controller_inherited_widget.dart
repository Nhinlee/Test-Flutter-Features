import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewControllerInheritedWidget extends InheritedWidget {
  const WebviewControllerInheritedWidget({
    Key? key,
    required this.controller,
    required Widget child,
  }) : super(child: child);

  final WebViewController controller;

  static WebviewControllerInheritedWidget of(BuildContext context) {
    final WebviewControllerInheritedWidget? result = context
        .dependOnInheritedWidgetOfExactType<WebviewControllerInheritedWidget>();
    assert(
        result != null, 'No WebviewControllerInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(WebviewControllerInheritedWidget old) {
    return true;
  }
}
