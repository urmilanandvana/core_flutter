import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Global/global.dart';
import '../resources/theme.dart';
import 'model/conatct_model.dart';

class addPage extends StatefulWidget {
  const addPage({Key? key}) : super(key: key);

  @override
  State<addPage> createState() => _addPageState();
}

class _addPageState extends State<addPage> {
  GlobalKey<FormState> addFormKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final _picker = ImagePicker();

  TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: (AppTheme.isDark) ? Colors.white : Colors.black,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (AppTheme.isDark) ? Colors.black : Colors.white,
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
          icon: Icon(
            Icons.arrow_back,
            color: (AppTheme.isDark) ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          "Add",
          style: TextStyle(
            color: (AppTheme.isDark) ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (addFormKey.currentState!.validate()) {
                addFormKey.currentState!.save();
                Conatct c1 = Conatct(
                  firstName: Global.firstName,
                  lastName: Global.lastName,
                  phoneNumber: Global.phoneNumber,
                  email: Global.email,
                  image: Global.image,
                );
                setState(() {
                  Global.allContact.add(c1);
                });
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              }
            },
            icon: Icon(
              Icons.check,
              color: (AppTheme.isDark) ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: Expanded(
              flex: 2,
              child: InkWell(
                onTap: () async {
                  XFile? pickedImage =
                      await _picker.pickImage(source: ImageSource.camera);
                  setState(() {
                    Global.image = File(pickedImage!.path);
                  });
                },
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey,
                  backgroundImage:
                      (Global.image != null) ? FileImage(Global.image!) : null,
                  child: (Global.image != null)
                      ? Text("")
                      : Text(
                          "add",
                          style: TextStyle(
                            color:
                                (AppTheme.isDark) ? Colors.white : Colors.black,
                          ),
                        ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            flex: 5,
            child: Form(
              key: addFormKey,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "First Name",
                      style: title,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      color: (AppTheme.isDark) ? Colors.white38 : Colors.white,
                      child: TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter the First Name...";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          Global.firstName = val;
                        },
                        controller: firstNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "First Name",
                          hintStyle: TextStyle(
                            color: (AppTheme.isDark)
                                ? Colors.white70
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Last Name",
                      style: title,
                    ),
                    SizedBox(height: 10),
                    Container(
                      color: (AppTheme.isDark) ? Colors.white38 : Colors.white,
                      child: TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter the Last Name...";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          Global.lastName = val;
                        },
                        controller: lastNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: (AppTheme.isDark)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          hintText: "Last Name",
                          hintStyle: TextStyle(
                            color: (AppTheme.isDark)
                                ? Colors.white70
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Phone Number",
                      style: title,
                    ),
                    SizedBox(height: 10),
                    Container(
                      color: (AppTheme.isDark) ? Colors.white38 : Colors.white,
                      child: TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter the Phone Number...";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          Global.phoneNumber = val;
                        },
                        controller: phoneController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: (AppTheme.isDark)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          hintText: "+91 ",
                          hintStyle: TextStyle(
                            color: (AppTheme.isDark)
                                ? Colors.white70
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Email ",
                      style: title,
                    ),
                    SizedBox(height: 10),
                    Container(
                      color: (AppTheme.isDark) ? Colors.white38 : Colors.white,
                      child: TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter the Email Id...";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          Global.email = val;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: (AppTheme.isDark)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: (AppTheme.isDark)
                                ? Colors.white70
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: (AppTheme.isDark) ? Colors.black : Colors.white,
    );
  }
}
