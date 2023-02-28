import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_page/utils/share_pref.dart';


class LogoPage extends StatefulWidget {
  const LogoPage({Key? key}) : super(key: key);

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CheckLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.teal.shade600,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                    child: Text("TaskMe",style: TextStyle(color: Colors.white,fontSize: 50),)),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("powered by HNG",style: TextStyle(color: Colors.white,fontSize: 15),)),
                )
              ],
            ),
          ),
        )
    );
  }
}
