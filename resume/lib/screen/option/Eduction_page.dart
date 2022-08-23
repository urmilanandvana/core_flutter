import 'package:flutter/material.dart';

import '../../utils/global.dart';

class Eduction_Page extends StatefulWidget {
  const Eduction_Page({Key? key}) : super(key: key);

  @override
  State<Eduction_Page> createState() => _Eduction_PageState();
}

class _Eduction_PageState extends State<Eduction_Page> {
  final GlobalKey<FormState> educationFormKey = GlobalKey<FormState>();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController schoolNameController = TextEditingController();
  final TextEditingController percentageController = TextEditingController();
  final TextEditingController passingYearController = TextEditingController();
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
          "Education ",
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
                  height: _height / 1.5,
                  width: _width,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Form(
                    key: educationFormKey,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Course/Degree",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: courseController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter the Course... ";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.course = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "B.Tech Information Technology",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "School/College/Institute",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: schoolNameController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter the School/College/Institute name ... ";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.schoolName = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Bhagavan Mahavir University ",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "School/College/Institute",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: percentageController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter the School/College/Institute percentage... ";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.school = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "70% (or) 7.0 CGPA ",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Year of Pass",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: passingYearController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter the Passing Year... ";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.school = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "2021",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
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
                        if (educationFormKey.currentState!.validate()) {
                          educationFormKey.currentState!.save();
                        }
                      },
                      child: Text(
                        "save",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        educationFormKey.currentState!.reset();

                        courseController.clear();
                        schoolNameController.clear();
                        percentageController.clear();
                        passingYearController.clear();

                        setState(() {
                          Global.course = '';
                          Global.schoolName = '';
                          Global.school = '';
                          Global.yearOfPass = '';
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
