import 'package:flutter/material.dart';

import '../../utils/global.dart';

class Declaration_Page extends StatefulWidget {
  const Declaration_Page({Key? key}) : super(key: key);

  @override
  State<Declaration_Page> createState() => _Declaration_PageState();
}

class _Declaration_PageState extends State<Declaration_Page> {
  final GlobalKey<FormState> declarationFormKey = GlobalKey<FormState>();
  final TextEditingController declarationController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  bool switchVal = false;

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
          "Declaration",
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
                  height: _height / 1.7,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Form(
                    key: declarationFormKey,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Declaration",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Switch(
                                  value: switchVal,
                                  onChanged: (val) {
                                    setState(() {
                                      switchVal = val;
                                    });
                                  }),
                            ],
                          ),
                          SizedBox(height: 10),
                          Image.asset("assets/icon/target.png", width: 70),
                          SizedBox(height: 10),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: declarationController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter the Description ... ";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                Global.description = val;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Description",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade300,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Divider(
                            thickness: 2,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  Container(
                                    height: 40,
                                    width: 150,
                                    child: TextFormField(
                                      controller: dateController,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Enter the  Date..";
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        Global.date;
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
                              SizedBox(width: 20),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    """Place(Interview
venue/city)""",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    height: 40,
                                    width: 120,
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Enter the Place..";
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        Global.place;
                                      },
                                      controller: placeController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Eg Surat",
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
                        if (declarationFormKey.currentState!.validate()) {
                          declarationFormKey.currentState!.save();
                        }
                      },
                      child: Text(
                        "save",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        declarationFormKey.currentState!.reset();

                        declarationController.clear();
                        dateController.clear();
                        placeController.clear();

                        setState(() {
                          Global.descripation = '';
                          Global.date = '';
                          Global.place = '';
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
