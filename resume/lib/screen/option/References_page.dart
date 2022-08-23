import 'package:flutter/material.dart';

import '../../utils/global.dart';

class Referencs_Page extends StatefulWidget {
  const Referencs_Page({Key? key}) : super(key: key);

  @override
  State<Referencs_Page> createState() => _Referencs_PageState();
}

class _Referencs_PageState extends State<Referencs_Page> {
  final GlobalKey<FormState> referencesFormKey = GlobalKey<FormState>();
  final TextEditingController referenceNameController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController organizationController = TextEditingController();
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
        title: const Text(
          "References ",
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
                  height: _height / 2,
                  width: _width,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Form(
                    key: referencesFormKey,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Reference Name",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: referenceNameController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter the Reference Name ... ";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.referenceName = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Nandvana Urvi",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          const Text(
                            "Designation",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: designationController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter the Designation name ... ";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.designation = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Marketing Manager, ID 342332",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          const Text(
                            "Organization/Institute",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: organizationController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter the Organization Name... ";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.organization = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Green Energy Pvt Ltd ",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (referencesFormKey.currentState!.validate()) {
                          referencesFormKey.currentState!.save();
                        }
                      },
                      child: Text(
                        "save",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        referencesFormKey.currentState!.reset();

                        referenceNameController.clear();
                        designationController.clear();
                        organizationController.clear();

                        setState(() {
                          Global.referenceName = '';
                          Global.designation = '';
                          Global.organization = '';
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
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
