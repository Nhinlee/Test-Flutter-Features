import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_new_feature/web_view_test/webview_controller_inherited_widget.dart';
import 'package:test_new_feature/web_view_test/webview_mixin.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'learnosity_quiz_container.dart';

const localLink = "http://localhost:3000/assessment";
const stagingLink = "https://learnosity-web-view-staging.web.app/assessment";

class LearnosityEvents {
  static const String submitSuccess = 'test:submit:success';
  static const String itemGoto = 'item:goto';
}

class LearnosityFunctions {
  static const String saveAssessmentProgress = 'saveAssessmentProgress';
}

void main() {
  runApp(
    TestApp(),
  );
}

class TestApp extends StatefulWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> with WebViewMixin {
  @override
  void initState() {
    super.initState();

    initWebViewController(
      stagingLink,
      context: context,
      navigationDelegate: NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
        onPageFinished: (url) {
          initLearnosity();
        },
      ),
    );
  }

  void initLearnosity() {
    final signedRequest =
        "{\"request\":\"{\\\"activity_id\\\":\\\"01HJ5SGV61NHPFBC7A2FT6AZM7\\\",\\\"activity_template_id\\\":\\\"01HD3HY6GF5ECDCEB5V52J0HQT\\\",\\\"name\\\":\\\"LO - MA is OFF\\\",\\\"rendering_type\\\":\\\"assess\\\",\\\"session_id\\\":\\\"fef3b6e3-6b9e-423d-8287-22f4fb5673ee\\\",\\\"user_id\\\":\\\"01H454FXR2CJCHHWNGRRJKT2H6\\\"}\",\"security\":{\"consumer_key\":\"9aEFbPBGumSobshV\",\"domain\":\"localhost\",\"signature\":\"78a923e10eb90a52aa924c94a2db88df9dcadba0237c5aa52f1636ce35c6f8b1\",\"timestamp\":\"20231222-0714\",\"user_id\":\"01H454FXR2CJCHHWNGRRJKT2H6\"}}";
    String stagingSQ =
        "{\"request\":\"{\\\"activity_id\\\":\\\"01HJ5SGV61NHPFBC7A2FT6AZM7\\\",\\\"activity_template_id\\\":\\\"01HD3HY6GF5ECDCEB5V52J0HQT\\\",\\\"name\\\":\\\"LO - MA is OFF\\\",\\\"rendering_type\\\":\\\"assess\\\",\\\"session_id\\\":\\\"fef3b6e3-6b9e-423d-8287-22f4fb5673ee\\\",\\\"user_id\\\":\\\"01H454FXR2CJCHHWNGRRJKT2H6\\\"}\",\"security\":{\"consumer_key\":\"9aEFbPBGumSobshV\",\"domain\":\"learnosity-web-view-staging.web.app\",\"signature\":\"55922c44588dfe12a78a2e7a1177d5f82ab0b08348c282aa575fec63e5c1120e\",\"timestamp\":\"20231222-0828\",\"user_id\":\"01H454FXR2CJCHHWNGRRJKT2H6\"}}";
    executeCrossJSMethod(
      'initLearnosity',
      [
        stagingSQ,
        [].toString(),
      ],
    );
  }

  void executeCrossJSMethod(String methodName, List<String> arguments) {
    final argumentsString = arguments.map((e) => json.encode(e)).join(',');
    final functionName = "$methodName($argumentsString);";
    webViewController?.runJavaScript(
      functionName,
    );
    debugPrint(">> Done init");
  }

  @override
  Widget build(BuildContext context) {
    return WebviewControllerInheritedWidget(
      controller: webViewController,
      child: MaterialApp(
        home: const TestScreen(),
      ),
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return buildScaffold(context);
  }

  Scaffold buildScaffold(BuildContext context) {
    final webViewController =
        WebviewControllerInheritedWidget.of(context)?.controller;
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: Text("Wellcome to LRN, ahihi..."),
          ),
          IgnorePointer(
            child: Opacity(
              opacity: 0.0,
              child: WebViewWidget(
                controller: webViewController!,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.navigate_next,
        ),
        onPressed: () {
          // Reset LRN before start
          executeCrossJSMethod(webViewController!, 'resetLearnosity', []);

          // Cached
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LearnosityQuizContainer(),
            ),
          );

          // No cache
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => NotInheritLearnosityQuizContainer(),
          //   ),
          // );
        },
      ),
    );
  }

  void executeCrossJSMethod(
    WebViewController controller,
    String methodName,
    List<String> arguments,
  ) {
    final argumentsString = arguments.map((e) => json.encode(e)).join(',');
    final functionName = "$methodName($argumentsString);";
    controller.runJavaScript(
      functionName,
    );
    debugPrint(">> Done init");
  }
}
