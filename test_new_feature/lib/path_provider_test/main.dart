import 'package:flutter/material.dart';
import 'package:test_new_feature/path_provider_test/path_provider_test_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const _title = 'flutter_downloader demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const PathProviderTestScreen(),
    );
  }
}
