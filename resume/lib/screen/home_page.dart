import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        elevation: 0,
        title: Text(
          "Resume Builder",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade800,
        onPressed: () {
          Navigator.of(context).pushNamed('build_options');
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: _width,
              alignment: Alignment.center,
              color: Colors.blue.shade800,
              child: const Text(
                "RESUMES",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(flex: 1),
                Image.asset(
                  "assets/icon/open-cardboard-box.png",
                  width: 50,
                ),
                SizedBox(height: 10),
                Text(
                  "No Resumes + Create new resume.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
                Spacer(flex: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
