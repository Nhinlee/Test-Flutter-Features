import 'package:flutter/material.dart';
import 'package:test_new_feature/web_view_test/learnosity_quiz_container.dart';
import 'package:test_new_feature/web_view_test/webview_controller_inherited_widget.dart';
import 'package:test_new_feature/web_view_test/webview_mixin.dart';
import 'package:webview_flutter/webview_flutter.dart';

final localLink = "http://localhost:3000/assessment";
final stagingLink = "https://learnosity-web-view-staging.web.app/assessment";

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
          // initLearnosity();
        },
      ),
    );
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
    return Scaffold(
      body: Center(
        child: Text("Wellcome to LRN, ahihi..."),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.navigate_next,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LearnosityQuizContainer(),
            ),
          );
        },
      ),
    );
  }
}
