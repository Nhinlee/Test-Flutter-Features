import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as p;

class PathProviderTestScreen extends StatefulWidget {
  const PathProviderTestScreen({Key? key}) : super(key: key);

  @override
  State<PathProviderTestScreen> createState() => _PathProviderTestScreenState();
}

class _PathProviderTestScreenState extends State<PathProviderTestScreen> {
  String _applicationSupportPath = '???';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Path Provider"),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetDirPathWidget(
              onTap: () async {
                final dir = await p.getDownloadsDirectory();
                setState(() {
                  _applicationSupportPath = dir!.path;
                });
              },
              title: "Application Support",
              path: _applicationSupportPath,
            ),
          ],
        ),
      ),
    );
  }
}

class GetDirPathWidget extends StatelessWidget {
  const GetDirPathWidget({
    Key? key,
    required this.path,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String path;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
        const SizedBox(height: 16),
        Text(path),
        const SizedBox(height: 16),
        TextButton(
          onPressed: onTap,
          child: const Text('Get Dir'),
        ),
      ],
    );
  }
}
