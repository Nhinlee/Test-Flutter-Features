import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_new_feature/web_view_test/webview_controller_inherited_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

// #enddocregion platform_imports

class LearnosityQuizContainer extends StatefulWidget {
  const LearnosityQuizContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<LearnosityQuizContainer> createState() =>
      LearnosityQuizContainerState();
}

class LearnosityQuizContainerState extends State<LearnosityQuizContainer> {
  late WebViewController? webViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    webViewController =
        WebviewControllerInheritedWidget.of(context)?.controller;
    initLearnosity();
  }

  Size get screenSize => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: webViewController!,
      ),
    );
  }

  void initLearnosity() {}

  void executeCrossJSMethod(String methodName, List<String> arguments) {
    final argumentsString = arguments.map((e) => json.encode(e)).join(',');
    final functionName = "$methodName($argumentsString);";
    webViewController?.runJavaScript(
      functionName,
    );
  }
}
