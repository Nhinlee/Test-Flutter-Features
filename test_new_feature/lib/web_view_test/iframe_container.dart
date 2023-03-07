import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        home: IframeContainer(),
      ),
    );

class IframeContainer extends StatefulWidget {
  const IframeContainer({Key? key}) : super(key: key);

  @override
  State<IframeContainer> createState() => _IframeContainerState();
}

class _IframeContainerState extends State<IframeContainer> {
  @override
  void initState() {
    super.initState();

    final _iframeElement = IFrameElement();
    _iframeElement.height = '500';
    _iframeElement.width = '500';
    _iframeElement.src = 'https://flutter.dev/';
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
  }

  void eventListener(Event event) {
    final messageEvent = event as MessageEvent;
    print('>>>> ${messageEvent.data}');
    print('>>>> ${messageEvent.origin}');
    // …
  }

  @override
  void dispose() {
    window.removeEventListener("message", eventListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Container(
              width: 120,
              decoration: const BoxDecoration(color: Colors.blue),
            ),
            Expanded(
              child: HtmlElementView(
                key: UniqueKey(),
                viewType: 'iframeElement',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
