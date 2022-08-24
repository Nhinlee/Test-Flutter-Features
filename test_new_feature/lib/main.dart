import 'package:flutter/material.dart';
import 'package:test_new_feature/test_drag_and_drop.dart';
import 'package:test_new_feature/test_flutter_reorderable_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Row(
          children: const [
            // Expanded(
            //   child: TestReorderablesScreen(),
            // ),
            Expanded(
              child: TestFlutterReorderableListView(),
            ),
            Expanded(
              child: DragAndDropTestScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
