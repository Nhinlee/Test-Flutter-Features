import 'dart:io';

import 'package:dio/dio.dart';
import 'package:external_path/external_path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

const imgUrl =
    "https://storage.googleapis.com/stag-manabie-backend/user-upload/Head%20First%20Design%20Patterns01GC8EACN8818KT9ANCAS4NJYN.pdf";
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
      // await file.create(recursive: true);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
      print(file);
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
                final downloadPath =
                    await ExternalPath.getExternalStoragePublicDirectory(
                  ExternalPath.DIRECTORY_DOWNLOADS,
                );
                print(downloadPath);
                //
                // if (await Permission.manageExternalStorage
                //     .request()
                //     .isGranted) {
                // final dirPath = await FilePicker.platform
                //     .getDirectoryPath(initialDirectory: './Download');
                // print(dirPath);
                // if (dirPath == null) return;
                String fullPath = downloadPath + "/book.pdf";
                // print('full path $fullPath');

                download2(dio, imgUrl, fullPath);
                // }
              },
              icon: const Icon(
                Icons.file_download,
                color: Colors.white,
              ),
              color: Colors.green,
              textColor: Colors.white,
              label: const Text('Choose folder and start dowload'),
            ),
            TextButton(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowMultiple: false,
                  allowedExtensions: [
                    'zip',
                    'pdf',
                  ],
                );
              },
              child: const Text('Get zip files'),
            ),
          ],
        ),
      ),
    );
  }
}
