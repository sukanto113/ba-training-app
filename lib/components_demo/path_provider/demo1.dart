import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PathProviderDemo1 extends StatelessWidget {
  const PathProviderDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: OutlinedButton(
            onPressed: () async {
              try {
                print(
                    'ApplicationDocuments: ${await getApplicationDocumentsDirectory()}');
              } catch (e) {}
              try {
                print(
                    'ApplicationSupport: ${await getApplicationSupportDirectory()}');
              } catch (e) {}
              try {
                print('Downloads: ${await getDownloadsDirectory()}');
              } catch (e) {}
              try {
                print('ExternalCache: ${await getExternalCacheDirectories()}');
              } catch (e) {}
              try {
                print(
                    'ExternalStorage: ${await getExternalStorageDirectories()}');
              } catch (e) {}
              try {
                print('Library: ${await getLibraryDirectory()}');
              } catch (e) {}
              try {
                print('Temporary: ${await getTemporaryDirectory()}');
              } catch (e) {}
            },
            child: const Text('Print path'),
          ),
        ),
      ),
    );
  }
}
