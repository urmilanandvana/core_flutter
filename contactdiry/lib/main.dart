import 'package:contactdiry/screen/add_page.dart';
import 'package:contactdiry/screen/detailpage.dart';
import 'package:contactdiry/screen/mypage.dart';
import 'package:contactdiry/screen/splashpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (_) => runApp(
      const HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_screen',
      routes: {
        '/': (context) => const HomePage2(),
        'add_page': (context) => const addPage(),
        'detail_page': (context) => const DetailPage(),
        'splash_screen': (context) => const SplashScreen(),
      },
    );
  }
}
