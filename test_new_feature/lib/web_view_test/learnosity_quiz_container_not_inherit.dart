import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_new_feature/web_view_test/webview_mixin.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'main.dart';

// #enddocregion platform_imports

class NotInheritLearnosityQuizContainer extends StatefulWidget {
  const NotInheritLearnosityQuizContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<NotInheritLearnosityQuizContainer> createState() =>
      LearnosityQuizContainerState();
}

class LearnosityQuizContainerState
    extends State<NotInheritLearnosityQuizContainer> with WebViewMixin {
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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

  void initLearnosity() async {
    await webViewController.clearCache();
    await webViewController.clearLocalStorage();
    // final signedRequest =
    //     '{\"request\":\"{\\\"activity_id\\\":\\\"01HJ5SGV61NHPFBC7A2FT6AZM7\\\",\\\"activity_template_id\\\":\\\"01HD3HY6GF5ECDCEB5V52J0HQT\\\",\\\"name\\\":\\\"LO - MA is OFF\\\",\\\"rendering_type\\\":\\\"assess\\\",\\\"session_id\\\":\\\"fef3b6e3-6b9e-423d-8287-22f4fb5673ee\\\",\\\"user_id\\\":\\\"01H454FXR2CJCHHWNGRRJKT2H6\\\"}\",\"security\":{\"consumer_key\":\"9aEFbPBGumSobshV\",\"domain\":\"localhost\",\"signature\":\"78a923e10eb90a52aa924c94a2db88df9dcadba0237c5aa52f1636ce35c6f8b1\",\"timestamp\":\"20231222-0714\",\"user_id\":\"01H454FXR2CJCHHWNGRRJKT2H6\"}}';
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
  }
}
