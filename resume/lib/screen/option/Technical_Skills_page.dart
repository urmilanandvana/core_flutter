import 'package:flutter/material.dart';

import '../../utils/global.dart';

class Techinical_Skills_Page extends StatefulWidget {
  const Techinical_Skills_Page({Key? key}) : super(key: key);

  @override
  State<Techinical_Skills_Page> createState() => _Techinical_Skills_PageState();
}

class _Techinical_Skills_PageState extends State<Techinical_Skills_Page> {
  List<Row> allTextField = [];
  List<TextEditingController> allController = [];

  @override
  initState() {
    super.initState();
    allController.add(TextEditingController());
    allController.add(TextEditingController());
    allTextField.add(getTextField(i: 0, row: Row()));
    allTextField.add(getTextField(i: 1, row: Row()));
  }

  final GlobalKey<FormState> carrierFormKey = GlobalKey<FormState>();

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
          "Technical Skills ",
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
            alignment: Alignment.center,
            color: Colors.grey.shade300,
            child: Form(
              key: carrierFormKey,
              child: Column(
                children: [
                  Container(
                    width: _width,
                    margin: EdgeInsets.all(20),
                    color: Colors.white70,
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Text(
                          "Enter your skills",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        ...allTextField
                            .map((e) => getTextField(
                                i: allTextField.indexOf(e), row: e))
                            .toList(),
                        SizedBox(height: 30),
                        Container(
                          height: 50,
                          width: _width,
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: SizedBox.expand(
                            child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  allController.add(TextEditingController());
                                  allTextField.add(getTextField(
                                      i: allTextField.length, row: Row()));
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            allController.forEach((element) {
                              print(element.text);
                            });
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row getTextField({required int i, required Row row}) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              controller: allController[i],
              validator: (val) {
                if (val!.isEmpty) {
                  return "Enter the Skill...";
                }
                return null;
              },
              onSaved: (val) {
                setState(() {
                  Global.skill = val;
                });
              },
              decoration: InputDecoration(
                hintText: "C Programing, Web Technical",
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                allController.removeAt(i);
                allTextField.remove(row);
              });
            },
            icon: Icon(
              Icons.delete,
              size: 30,
            )),
      ],
    );
  }
}
