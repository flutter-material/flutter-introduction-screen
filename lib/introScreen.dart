import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeScreen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  // 儲存 SharedPreferences 並標示已閱讀
  storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 1;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        scrollPhysics: BouncingScrollPhysics(),
        pages: [
          // page 1
          PageViewModel(
            titleWidget: Text("Title of page",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            body: "page demo~~~~",
            image: Image.asset(
              "images/screen1.png",
              height: 400,
              width: 400,
            ),
          ),
          // page 2
          PageViewModel(
            titleWidget: Text("Title of page",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            body: "page demo~~~~",
            image: Image.asset(
              "images/screen1.png",
              height: 400,
              width: 400,
            ),
          ),
          // page 3
          PageViewModel(
            titleWidget: Text("Title of page",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            body: "page demo~~~~",
            image: Image.asset(
              "images/screen1.png",
              height: 400,
              width: 400,
            ),
          ),
        ],
        onDone: () {
          // 儲存訊息
          storeOnboardInfo();
          // 頁面跳轉到主畫面
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        onSkip: () {
          // 儲存訊息
          storeOnboardInfo();
          // 頁面跳轉到主畫面
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        showSkipButton: true,
        skip: Text(
          "Skip",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF6C63FF),
          ),
        ),
        next: Icon(
          Icons.arrow_forward,
          color: Color(0xFF6C63FF),
        ),
        done: Text(
          "Done",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF6C63FF),
          ),
        ),
        dotsDecorator: DotsDecorator(
          size: Size.square(10),
          activeSize: Size(20, 10),
          color: Colors.black26,
          activeColor: Color(0xFF6C63FF),
          spacing: EdgeInsets.symmetric(horizontal: 3),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }
}
