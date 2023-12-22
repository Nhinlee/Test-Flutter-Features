import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        home: LearnosityQuizContainer(
          learnosityUrl: 'http://localhost:3000/',
        ),
      ),
    );

class LearnosityQuizContainer extends StatefulWidget {
  const LearnosityQuizContainer({
    Key? key,
    required this.learnosityUrl,
    this.onFinishQuizTest,
  }) : super(key: key);

  final String learnosityUrl;
  final Function()? onFinishQuizTest;

  @override
  State<LearnosityQuizContainer> createState() =>
      _LearnosityQuizContainerState();
}

class _LearnosityQuizContainerState extends State<LearnosityQuizContainer> {
  final _iframeElement = IFrameElement();

  @override
  void initState() {
    super.initState();

    _iframeElement.src = widget.learnosityUrl;
    _iframeElement.style.border = 'none';
    // _iframeElement.addEventListener(
    //   'window',
    //   (event) {
    //     print('>>>> $event');
    //   },
    // );

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    window.addEventListener("message", eventListener);
    // window.onMessage.forEach(eventListener);
  }

  @override
  void dispose() {
    window.removeEventListener("message", eventListener);
    super.dispose();
  }

  void eventListener(Event event) {
    final messageEvent = event as MessageEvent;
    print('>>>> ${messageEvent.data}');
    print('>>>> ${messageEvent.origin}');

    widget.onFinishQuizTest?.call();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _iframeElement.contentWindow?.postMessage(
          'saveAssessmentProgress',
          '*',
        );
        return false;
      },
      child: Scaffold(
        body: HtmlElementView(
          key: UniqueKey(),
          viewType: 'iframeElement',
        ),
      ),
    );
  }
}
