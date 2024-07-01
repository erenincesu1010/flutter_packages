import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:appinio_social_share/appinio_social_share.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppinioSocialShare appinioSocialShare = AppinioSocialShare();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Share Feature",
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("ShareToSms"),
              onPressed: () async {
                try {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(type: FileType.image, allowMultiple: false);
                  if (result != null && result.paths.isNotEmpty) {
                    shareToSms("message", result.paths[0]!);
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  shareToSms(String message, String filePath) async {
    final result = await appinioSocialShare.iOS.shareToSMS(message, filePath);
    print(result);
    await appinioSocialShare.iOS.shareToSMS(message, filePath);
  }
}
