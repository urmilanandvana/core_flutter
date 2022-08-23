import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../utils/global.dart';

class Personal_Detail_Page extends StatefulWidget {
  const Personal_Detail_Page({Key? key}) : super(key: key);

  @override
  State<Personal_Detail_Page> createState() => _Personal_Detail_PageState();
}

class _Personal_Detail_PageState extends State<Personal_Detail_Page> {
  final GlobalKey<FormState> carrierFormKey = GlobalKey<FormState>();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();

  bool englishCheckBoxVal = false;
  bool hindiCheckBoxVal = false;
  bool gujaratiCheckBoxVal = false;

  dynamic radioGroupVal = "Status";
  Color singleText1Color = Colors.grey.shade300;
  Color marriedTextColor = Colors.grey.shade300;
  Color englishTextColor = Colors.grey.shade300;
  Color hindiTextColor = Colors.grey.shade300;
  Color gujaratiTextColor = Colors.grey.shade300;
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
          "Personal Details ",
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
                  height: _height / 1.4,
                  width: _width,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Form(
                    key: carrierFormKey,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DOB",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: dobController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter the DOB ....";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.dob = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: " DD/MM/YY",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Marital Status",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: "single",
                                  groupValue: radioGroupVal,
                                  onChanged: (val) {
                                    singleText1Color = Colors.blue;
                                    setState(() {
                                      radioGroupVal = val;
                                    });
                                  }),
                              Text(
                                "Single",
                                style: TextStyle(
                                  color: singleText1Color,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: "married",
                                  groupValue: radioGroupVal,
                                  onChanged: (val) {
                                    marriedTextColor = Colors.blue;

                                    setState(() {
                                      radioGroupVal = val;
                                    });
                                  }),
                              Text(
                                "Married",
                                style: TextStyle(
                                  color: marriedTextColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Language Known",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: englishCheckBoxVal,
                                onChanged: (val) {
                                  englishTextColor = Colors.blue;
                                  setState(() {
                                    englishCheckBoxVal = val!;
                                  });
                                },
                              ),
                              Text(
                                "English",
                                style: TextStyle(
                                  color: englishTextColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: hindiCheckBoxVal,
                                onChanged: (val) {
                                  hindiTextColor = Colors.blue;
                                  setState(() {
                                    hindiCheckBoxVal = val!;
                                  });
                                },
                              ),
                              Text(
                                "Hindi",
                                style: TextStyle(
                                  color: hindiTextColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: gujaratiCheckBoxVal,
                                onChanged: (val) {
                                  gujaratiTextColor = Colors.blue;
                                  setState(() {
                                    gujaratiCheckBoxVal = val!;
                                  });
                                },
                              ),
                              Text(
                                "Gujarati",
                                style: TextStyle(
                                  color: gujaratiTextColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Nationality",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: nationalityController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter the Nationality ....";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.nationality = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: " Indian",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (carrierFormKey.currentState!.validate()) {
                                    carrierFormKey.currentState!.save();
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
                                  carrierFormKey.currentState!.reset();

                                  dobController.clear();
                                  nationalityController.clear();

                                  setState(() {
                                    Global.dob = '';
                                    Global.nationality = '';
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
