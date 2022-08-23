import 'package:flutter/material.dart';
import 'package:resume/pdf.dart';
import 'package:resume/screen/build_option.dart';
import 'package:resume/screen/home_page.dart';
import 'package:resume/screen/option/Achievements_page.dart';
import 'package:resume/screen/option/Carrier_Objective_page.dart';
import 'package:resume/screen/option/Contact_info_page.dart';
import 'package:resume/screen/option/Declaration_page.dart';
import 'package:resume/screen/option/Experiences_page.dart';
import 'package:resume/screen/option/Interest_Hobbies_page.dart';
import 'package:resume/screen/option/Projects_page.dart';
import 'package:resume/screen/option/References_page.dart';
import 'package:resume/screen/option/Technical_Skills_page.dart';
import 'screen/option/Eduction_page.dart';
import 'screen/option/Personal_Details_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        'build_options': (context) => buildOptions(),
        'Contact_info_page': (context) => Contact_Info_Page(),
        'Carrier_Objective_page': (context) => Carrier_Objective_Page(),
        'Personal_Details_page': (context) => Personal_Detail_Page(),
        'Eduction_page': (context) => Eduction_Page(),
        'Experiences_page': (context) => Experience_Page(),
        'Technical_Skills_page': (context) => Techinical_Skills_Page(),
        'Interest_Hobbies_page': (context) => Interest_Page(),
        'Projects_page': (context) => Projects_Page(),
        'Achievements_page': (context) => Achievements_Page(),
        'References_page': (context) => Referencs_Page(),
        'Declaration_page': (context) => Declaration_Page(),
        'pdf': (context) => PDF_Page(),
      },
    ),
  );
}
