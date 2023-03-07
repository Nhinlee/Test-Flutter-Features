import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'widgets/student_display_information.dart';

void main() {
  final store = Store<int>(
    (state, action) => 1,
    initialState: 1,
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    // required this.store,
  }) : super(key: key);

  // final Store<int> store;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: StudentInformationDisplay(
          grade: 'grade 1, grade 1, grade 1, grade 1, grade 1,grade 1',
          courses: 'course 1, course 5, course 1, course 5, course 1,'
              ' course 5, course 1, course 5,, course 1, course 5,, course 1, course 5,course 1, course 5,course 1, course 5,course 1, course 5,course 1, course 5,course 1, course 5,course 1, course 5,course 1, course 5,course 1, course 5,',
          studentClass:
              'class 1, class 2, class 3, class 1, class 2, class 3, class 1, class 2, class 3, class 1, class 2, class 3, class 2, class 3, class 1, class 2, class 3',
        ),
      ),
    );
  }
}
