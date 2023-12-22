import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
    // required this.store,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String testDumpString = "count: 0";
  int count = 0;
  // final Store<int> store;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: TestStf(title: testDumpString),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              count++;
              testDumpString = "count: $count";
            });
          },
        ),
      ),
    );
  }
}

class TestStf extends StatefulWidget {
  const TestStf({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TestStf> createState() => _TestStfState();
}

class _TestStfState extends State<TestStf> {
  @override
  void initState() {
    super.initState();

    print('>>>>>> init state');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('>>>>>> didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.title));
  }
}
