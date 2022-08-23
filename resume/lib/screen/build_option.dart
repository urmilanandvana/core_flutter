import 'package:flutter/material.dart';

import '../list.dart';

class buildOptions extends StatefulWidget {
  const buildOptions({Key? key}) : super(key: key);

  @override
  State<buildOptions> createState() => _buildOptionsState();
}

class _buildOptionsState extends State<buildOptions> {
  TextStyle textStyle = TextStyle(
    color: Colors.black,
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop('home_page');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade800,
        elevation: 0,
        title: Text(
          "Resume Workspace",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('pdf');
            },
            icon: Icon(Icons.picture_as_pdf),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: _width,
              alignment: Alignment.center,
              color: Colors.blue.shade800,
              child: const Text(
                "Build Options",
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...list.map((option) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(option['route']);
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 15),
                              Image.asset(
                                option['image'],
                                width: 50,
                              ),
                              SizedBox(width: 25),
                              Text(
                                option['title'],
                                style: textStyle,
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios),
                              SizedBox(width: 15),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 2,
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
