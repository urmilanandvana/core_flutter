import 'package:flutter/material.dart';

import '../../utils/global.dart';

class Experience_Page extends StatefulWidget {
  const Experience_Page({Key? key}) : super(key: key);

  @override
  State<Experience_Page> createState() => _Experience_PageState();
}

class _Experience_PageState extends State<Experience_Page> {
  final GlobalKey<FormState> experienceFormKey = GlobalKey<FormState>();

  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController employeeStatueController =
      TextEditingController();
  final TextEditingController joinController = TextEditingController();
  final TextEditingController exitController = TextEditingController();

  dynamic radioGroupVal = "employeeStatus";

  Color radioColor = Colors.grey;

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
          "Experiences ",
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
                  height: _height / 1.28,
                  width: _width,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Form(
                    key: experienceFormKey,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Company Name",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: companyNameController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter the Company name... ";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.companyName = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "New Enterprise San Francisco",
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
                            controller: schoolController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter the Quality Test ... ";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.quality = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Quality Test Engineer",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Roles (optional)",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            maxLines: 3,
                            controller: roleController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter the Roles... ";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.role = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText:
                                  "Working with team members to come up with new concepts and product analysis... ",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Employed Statue",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: "PE",
                                  groupValue: radioGroupVal,
                                  onChanged: (val) {
                                    setState(() {
                                      radioGroupVal = val;
                                    });
                                  }),
                              Text(
                                "Previously Employed",
                                style: TextStyle(
                                  color: radioColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Radio(
                                  value: "CE",
                                  groupValue: radioGroupVal,
                                  onChanged: (val) {
                                    setState(() {
                                      radioGroupVal = val;
                                    });
                                  }),
                              Text(
                                "Currently Employed",
                                style: TextStyle(
                                  color: radioColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date Joined",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 150,
                                    child: TextFormField(
                                      controller: joinController,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Enter the Exit Date..";
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        Global.joinDate;
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "DD/MM/YYYY",
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
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date Exit",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 150,
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Enter the Exit Date..";
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        Global.exitDate;
                                      },
                                      controller: exitController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "DD/MM/YYYY",
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
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (experienceFormKey.currentState!
                                      .validate()) {
                                    experienceFormKey.currentState!.save();
                                  }
                                },
                                child: Text(
                                  "save",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  experienceFormKey.currentState!.reset();

                                  companyNameController.clear();
                                  schoolController.clear();
                                  roleController.clear();
                                  employeeStatueController.clear();

                                  setState(() {
                                    Global.companyName = '';
                                    Global.quality = '';
                                    Global.role = '';
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
