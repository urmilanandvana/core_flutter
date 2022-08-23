import 'dart:io';

import 'package:flutter/material.dart';

import '../../utils/global.dart';
import 'package:image_picker/image_picker.dart';

class Contact_Info_Page extends StatefulWidget {
  const Contact_Info_Page({Key? key}) : super(key: key);

  @override
  State<Contact_Info_Page> createState() => _Contact_Info_PageState();
}

class _Contact_Info_PageState extends State<Contact_Info_Page> {
  final ImagePicker _picker = ImagePicker();

  int initialIndex = 0;

  final GlobalKey<FormState> contactFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController address1Controller = TextEditingController();
  final TextEditingController address2Controller = TextEditingController();
  final TextEditingController address3Controller = TextEditingController();

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
          "Resume Workspace",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: _height * 1.5,
              width: _width,
              color: Colors.blue.shade800,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            initialIndex = 0;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Contact",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(height: 15),
                            Divider(
                              height: 1,
                              color: Colors.redAccent,
                              thickness: 10,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            initialIndex = 1;
                          });
                        },
                        child: Text(
                          "Photo",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              width: _width,
              height: _height,
              color: Colors.grey.shade300,
              child: IndexedStack(
                index: initialIndex,
                children: [
                  // contact page
                  Column(
                    children: [
                      Container(
                        height: _height * 0.5,
                        width: _width,
                        color: Colors.white,
                        margin: EdgeInsets.all(20),
                        child: Form(
                          key: contactFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 20),
                                child: TextFormField(
                                  controller: nameController,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter the first name ....";
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    setState(() {
                                      Global.name = val;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.person, size: 50),
                                    iconColor: Colors.grey,
                                    hintText: "Name",
                                    hintStyle: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 20),
                                child: TextFormField(
                                  controller: emailController,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter the first Email ....";
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    setState(() {
                                      Global.email = val;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.email, size: 50),
                                    iconColor: Colors.grey,
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 20),
                                child: TextFormField(
                                  controller: phoneController,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter the first Phone ....";
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    setState(() {
                                      Global.phone = val;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.phone_android, size: 50),
                                    iconColor: Colors.grey,
                                    hintText: "Phone",
                                    hintStyle: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 20),
                                child: TextFormField(
                                  controller: address1Controller,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter the first Address ....";
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    setState(() {
                                      Global.address1 = val;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.location_on, size: 50),
                                    iconColor: Colors.grey,
                                    hintText: "Address (Street Building No)",
                                    hintStyle: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 74, right: 20),
                                child: TextFormField(
                                  controller: address2Controller,
                                  onSaved: (val) {
                                    setState(() {
                                      Global.address2 = val;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    iconColor: Colors.grey,
                                    hintText: "Address Line 2",
                                    hintStyle: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 74, right: 20),
                                child: TextFormField(
                                  controller: address3Controller,
                                  onSaved: (val) {
                                    setState(() {
                                      Global.address3 = val;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    iconColor: Colors.grey,
                                    hintText: "Address Line 3",
                                    hintStyle: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (contactFormKey.currentState!.validate()) {
                                contactFormKey.currentState!.save();
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
                              contactFormKey.currentState!.reset();

                              nameController.clear();
                              emailController.clear();
                              phoneController.clear();
                              address1Controller.clear();
                              address2Controller.clear();
                              address3Controller.clear();

                              setState(() {
                                Global.name = '';
                                Global.email = '';
                                Global.phone = '';
                                Global.address1 = '';
                                Global.address2 = '';
                                Global.address3 = '';
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
                      Spacer(flex: 2),
                    ],
                  ),
                  //image page
                  Column(
                    children: [
                      Container(
                        height: _height / 3,
                        width: _width,
                        color: Colors.white,
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(20),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              backgroundImage: (Global.image != null)
                                  ? FileImage(Global.image!)
                                  : null,
                              radius: 60,
                              backgroundColor: Colors.grey.shade300,
                              child: (Global.image != null)
                                  ? Text("")
                                  : Text(
                                      "ADD",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                            ),
                            FloatingActionButton(
                              onPressed: () async {
                                XFile? pickedFile = await _picker.pickImage(
                                    source: ImageSource.camera);
                                setState(() {
                                  Global.image = File(pickedFile!.path);
                                });
                              },
                              mini: true,
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
