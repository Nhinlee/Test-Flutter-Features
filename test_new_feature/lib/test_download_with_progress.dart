import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

const imgUrl = "push your url here";
var dio = Dio();

class TestDownloadWithProgress extends StatefulWidget {
  const TestDownloadWithProgress({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _TestDownloadWithProgressState createState() =>
      _TestDownloadWithProgressState();
}

class _TestDownloadWithProgressState extends State<TestDownloadWithProgress> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future download2(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      setState(() {
        _progress = (received / total * 100).toStringAsFixed(0);
      });
    }
  }

  String _progress = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_progress %'),
            RaisedButton.icon(
              onPressed: () async {
                var tempDir = await getTemporaryDirectory();
                String fullPath = tempDir.path + "/boo2.pdf'";
                print('full path $fullPath');

                download2(dio, imgUrl, fullPath);
              },
              icon: const Icon(
                Icons.file_download,
                color: Colors.white,
              ),
              color: Colors.green,
              textColor: Colors.white,
              label: const Text('Dowload Invoice'),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
