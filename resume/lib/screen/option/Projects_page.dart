import 'package:flutter/material.dart';

import '../../utils/global.dart';

class Projects_Page extends StatefulWidget {
  const Projects_Page({Key? key}) : super(key: key);

  @override
  State<Projects_Page> createState() => _Projects_PageState();
}

class _Projects_PageState extends State<Projects_Page> {
  final GlobalKey<FormState> projectFormKey = GlobalKey<FormState>();

  final TextEditingController projectController = TextEditingController();
  final TextEditingController technologies1Controller = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController technologies2Controller = TextEditingController();
  final TextEditingController descripationController = TextEditingController();

  bool cProgramingCheckBoxVal = false;
  bool oopCheckBoxVal = false;
  bool flutterCheckBoxVal = false;

  Color cpText1Color = Colors.grey.shade300;
  Color oopText1Color = Colors.grey.shade300;
  Color flutterText1Color = Colors.grey.shade300;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop('build_options');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade800,
        elevation: 0,
        title: Text(
          "Projects ",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: _height / 1.15,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                Container(
                  width: _width,
                  height: _height / 1.35,
                  color: Colors.white70,
                  margin: EdgeInsets.all(20),
                  child: Form(
                    key: projectFormKey,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Project Title ",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: projectController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter the Project Title... ";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.projectTitle = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Resume Builder App",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Technologies",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: cProgramingCheckBoxVal,
                                onChanged: (val) {
                                  cpText1Color = (cpText1Color == val)
                                      ? cpText1Color
                                      : Colors.blue;
                                  setState(() {
                                    cProgramingCheckBoxVal = val!;
                                  });
                                },
                              ),
                              Text(
                                "C programing",
                                style: TextStyle(
                                  color: cpText1Color,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: oopCheckBoxVal,
                                onChanged: (val) {
                                  oopText1Color = (oopText1Color == val)
                                      ? oopText1Color
                                      : Colors.blue;
                                  setState(() {
                                    oopCheckBoxVal = val!;
                                  });
                                },
                              ),
                              Text(
                                "C++",
                                style: TextStyle(
                                  color: oopText1Color,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: flutterCheckBoxVal,
                                onChanged: (val) {
                                  flutterText1Color = (flutterText1Color == val)
                                      ? flutterText1Color
                                      : Colors.blue;
                                  setState(() {
                                    flutterCheckBoxVal = val!;
                                  });
                                },
                              ),
                              Text(
                                "Flutter",
                                style: TextStyle(
                                  color: flutterText1Color,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Roles ",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            maxLines: 2,
                            controller: technologies1Controller,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Choice the filed... ";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.technologies1 = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Organize team members, Code analysis",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Technologies ",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: technologies2Controller,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Choice the filed... ";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.technologies2 = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "5 - Programmers",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Project Description ",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 50,
                            child: TextFormField(
                              controller: descripationController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter the Project Description... ";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.technologies2 = val;
                                });
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Enter Your Description",
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (projectFormKey.currentState!.validate()) {
                          projectFormKey.currentState!.save();
                          projectFormKey.currentState!.save();
                        }
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        projectFormKey.currentState!.reset();

                        projectController.clear();
                        roleController.clear();
                        technologies1Controller.clear();
                        technologies2Controller.clear();
                        descripationController.clear();

                        setState(() {
                          Global.projectTitle = '';
                          Global.technologies1 = '';
                          Global.technologies2 = '';
                          Global.role = '';
                          Global.description = '';
                        });
                      },
                      child: Text(
                        "Clear",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
