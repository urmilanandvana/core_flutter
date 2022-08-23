import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Global/global.dart';
import '../resources/theme.dart';
import 'dart:io';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final Uri _url = Uri.parse('https://flutter.dev');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (AppTheme.isDark) ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: (AppTheme.isDark) ? Colors.black : Colors.white,
        title: Text(
          "Contacts",
          style: TextStyle(
            color: (AppTheme.isDark) ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                AppTheme.isDark = !AppTheme.isDark;
              });
            },
            icon: Icon(
              Icons.circle,
              color: (AppTheme.isDark) ? Colors.white : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: (AppTheme.isDark) ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.of(context).pushNamed('add_page');
          });
        },
        child: Icon(
          Icons.add,
          color: (AppTheme.isDark) ? Colors.black : Colors.white,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: (Global.allContact.isEmpty)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 100,
                    color: (AppTheme.isDark) ? Colors.white : Colors.black,
                  ),
                  const Text(
                    "You have no contacts yet",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: Global.allContact.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    hoverColor: Colors.white38,
                    onTap: () {
                      Navigator.of(context).pushNamed('detail_page',
                          arguments: Global.allContact[i]);
                    },
                    tileColor: (AppTheme.isDark) ? Colors.black : Colors.white,
                    leading: CircleAvatar(
                      backgroundImage: (Global.allContact[i].image != null)
                          ? FileImage(Global.allContact[i].image as File)
                          : null,
                    ),
                    title: Text(
                      " ${Global.allContact[i].firstName} ${Global.allContact[i].lastName}",
                      style: TextStyle(
                        color: (AppTheme.isDark) ? Colors.white : Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      "+91 ${Global.allContact[i].phoneNumber}",
                      style: TextStyle(
                        color: (AppTheme.isDark) ? Colors.white60 : Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () async {
                        Uri url = Uri.parse(
                            "tel: +91${Global.allContact[i].phoneNumber}");

                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("can't be lunched..."),
                              backgroundColor: Colors.redAccent,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.green,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
