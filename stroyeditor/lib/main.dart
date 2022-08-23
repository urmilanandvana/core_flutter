import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stories_editor/stories_editor.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String giphyApiKey = "jlXFNVJk0EPbASUuYtCUk0KzMFUK71Lv";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => StoriesEditor(
                      giphyKey: giphyApiKey,
                      onDone: (uri) {
                        Share.shareFiles([uri]);
                      },
                    ),
                  ),
                );
              },
              child: Text("Open Story Editor"),
            ),
          ],
        ),
      ),
    );
  }
}
