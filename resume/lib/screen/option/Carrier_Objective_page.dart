import 'package:flutter/material.dart';

import '../../utils/global.dart';

class Carrier_Objective_Page extends StatefulWidget {
  const Carrier_Objective_Page({Key? key}) : super(key: key);

  @override
  State<Carrier_Objective_Page> createState() => _Carrier_Objective_PageState();
}

class _Carrier_Objective_PageState extends State<Carrier_Objective_Page> {
  final GlobalKey<FormState> objective1FormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> objective2FormKey = GlobalKey<FormState>();
  final TextEditingController objectiveController = TextEditingController();
  final TextEditingController currentDessignationController =
      TextEditingController();

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
          "Carrier Objective",
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
                  height: _height / 3,
                  width: _width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: objective1FormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Career Objective",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          maxLines: 7,
                          controller: objectiveController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter the first Career Objective ....";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              Global.descripation = val;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Descripation",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: _height / 4.5,
                  width: _width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: objective2FormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Current Designation (Experienced Candidate)",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: currentDessignationController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter the Current Designation....";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              Global.Dessignation = val;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Software Engineer",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (objective1FormKey.currentState!.validate() ||
                            objective2FormKey.currentState!.validate()) {
                          objective1FormKey.currentState!.save();
                          objective2FormKey.currentState!.save();
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
                        objective1FormKey.currentState!.reset();

                        objectiveController.clear();
                        currentDessignationController.clear();

                        setState(() {
                          Global.descripation = '';
                          Global.Dessignation = '';
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
