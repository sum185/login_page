import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:login_page/utils/share_pref.dart';
import 'package:lottie/lottie.dart';

class IntoPage extends StatefulWidget {
  const IntoPage({Key? key}) : super(key: key);

  @override
  State<IntoPage> createState() => _IntoPageState();
}

class _IntoPageState extends State<IntoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: IntroductionScreen(
            pages: [
              PageViewModel(
                image: Lottie.asset("assets/animation/t3.json"),
                title: "Signup New Account",
                body: "Step 1",
              ),
              PageViewModel(
                image: Lottie.asset("assets/animation/t2.json"),
                title: "Login Your Acoount",
                body: "Step 2",
              ),
              PageViewModel(
                image: Lottie.asset("assets/animation/t1.json"),
                title: "Welcome To Notes",
                body: "Finish",
              ),
            ],
            showDoneButton: true,
            onDone: (){
              introShr();
              Navigator.pushReplacementNamed(context, '/+');
            },
            done: Text("Done"),
            showNextButton: true,
            next: Text("Next"),
            skip: Text("Skip"),
            showSkipButton: true,
          ),
        ));
  }
}
