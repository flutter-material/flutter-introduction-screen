import 'package:flutter/material.dart';
import 'package:flutter_introduction_screen/HomeScreen.dart';
import 'package:flutter_introduction_screen/introScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed; // 判斷是否已經看過
void main() async {
  // 使用 Shared Preferences 存取資料
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  // Remove data for the 'onBoard' key.
  // final success = await prefs.remove('onBoard');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isviewed == 1 ? HomeScreen() : IntroScreen(),
    );
  }
}
