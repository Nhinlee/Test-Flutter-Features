import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// #docregion platform_imports
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
// #enddocregion platform_imports

class JavaScriptChannelCallBack {
  final String channelName;
  final void Function(JavaScriptMessage) onMessageReceived;

  JavaScriptChannelCallBack({
    required this.channelName,
    required this.onMessageReceived,
  });
}

mixin WebViewMixin {
  late WebViewController webViewController;

  PlatformWebViewControllerCreationParams initWebViewParams() {
    PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    return params;
  }

  void initWebViewController(
    String url, {
    required BuildContext context,
    required NavigationDelegate navigationDelegate,
    List<JavaScriptChannelCallBack> jsChannelCallback = const [],
    bool gestureNavigationEnabled = true,
    String? userAgent,
  }) {
    final params = initWebViewParams();
    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(
      params,
      onPermissionRequest: (request) async {
        await request.grant();
      },
    );

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(navigationDelegate)
      ..loadRequest(
        Uri.parse(url),
      );
    if (userAgent != null) controller.setUserAgent(userAgent);

    for (final callback in jsChannelCallback) {
      controller.addJavaScriptChannel(
        callback.channelName,
        onMessageReceived: callback.onMessageReceived,
      );
    }

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      final platformController =
          (controller.platform as AndroidWebViewController);
      platformController.setMediaPlaybackRequiresUserGesture(false);
    }

    if (controller.platform is WebKitWebViewController) {
      (controller.platform as WebKitWebViewController)
          .setAllowsBackForwardNavigationGestures(
        gestureNavigationEnabled,
      );
    }
    // #enddocregion platform_features

    controller.platform.setBackgroundColor(Colors.transparent);

    webViewController = controller;
  }
}
