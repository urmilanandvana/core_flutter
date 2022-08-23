import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Global/global.dart';
import '../resources/theme.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
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
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
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
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(flex: 3),
                CircleAvatar(
                  radius: 60,
                  backgroundImage:
                      (res.image != null) ? FileImage(res.image) : null,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Global.allContact.remove(res);

                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: (AppTheme.isDark) ? Colors.grey : Colors.black,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: (AppTheme.isDark) ? Colors.grey : Colors.black,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "${res.firstName} ${res.lastName}",
              style: TextStyle(
                color: (AppTheme.isDark) ? Colors.grey : Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                Text(
                  "+91 ${res.phoneNumber}",
                  style: TextStyle(
                    color: (AppTheme.isDark) ? Colors.grey : Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Divider(
              color: (AppTheme.isDark) ? Colors.grey : Colors.black,
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () async {
                    Uri url = Uri.parse("tel: +91${res.phoneNumber}");

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
                  mini: true,
                  child: Icon(
                    Icons.call,
                    color: (AppTheme.isDark) ? Colors.black : Colors.white,
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.orangeAccent,
                  onPressed: () async {
                    Uri url = Uri.parse("sms: ${res.phoneNumber}");

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
                  mini: true,
                  child: Icon(
                    Icons.sms,
                    color: (AppTheme.isDark) ? Colors.black : Colors.white,
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.teal,
                  onPressed: () async {
                    Uri url = Uri.parse(
                        "mailto:${res.email}?subject=News&body=hello ");

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
                  mini: true,
                  child: Icon(
                    Icons.email,
                    color: (AppTheme.isDark) ? Colors.black : Colors.white,
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.orange,
                  onPressed: () async {
                    Uri url = Uri.parse(
                        "mailto:${res.email}?subject=News&body=hello ");

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
                  mini: true,
                  child: Icon(
                    Icons.share,
                    color: (AppTheme.isDark) ? Colors.black : Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Divider(
              color: (AppTheme.isDark) ? Colors.grey : Colors.black,
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
