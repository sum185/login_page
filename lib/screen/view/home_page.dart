import 'package:flutter/material.dart';
import 'package:login_page/utils/share_pref.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar:AppBar(
            backgroundColor: Colors.teal,
            leading: IconButton(onPressed: (){
              IsLogin(false);
              Navigator.pushReplacementNamed(context, '/+');
            },icon: Icon(Icons.power_settings_new,color: Colors.white,)),
          ),
        )
    );
  }
}
