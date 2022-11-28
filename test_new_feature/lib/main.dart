import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:test_new_feature/test_flutter_reorderable_list_view.dart';

void main() {
  final store = Store<int>(
    (state, action) => 1,
    initialState: 1,
  );
  runApp(
    MyApp(
      store: store,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.store,
  }) : super(key: key);

  final Store<int> store;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoreProvider(
        child: const TestFlutterReorderableListView(),
        store: store,
      ),
    );
  }
}
