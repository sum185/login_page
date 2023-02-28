import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

void CreateShr(String email,String password)async{
  SharedPreferences shr = await SharedPreferences.getInstance();
  shr.setString("e1", email);
  shr.setString("p1", password);
}
Future<String?> readEmailPref()async{
  SharedPreferences shr = await SharedPreferences.getInstance();
  String? email = shr.getString("e1");
  return email;
}

Future<String?> readPasseordPref()async{
  SharedPreferences shr = await SharedPreferences.getInstance();
  String? password = shr.getString("p1");
  return password;
}
void IsLogin(bool log)async{
  SharedPreferences shr = await SharedPreferences.getInstance();
  shr.setBool("l1", log);
}

Future<bool?> Login() async {
  SharedPreferences shr = await SharedPreferences.getInstance();
  var log = shr.getBool("l1");
  return log;
}

void CheckLogin(BuildContext context) async
{
  var check = await Login();
  var intro = await readIntroShr();
  Timer(Duration(seconds: 3), () {
    if(check != null)
    {
      if(intro==true){
        if(check==true)
        {
          Navigator.pushReplacementNamed(context, 'h');
        }
        else
        {
          Navigator.pushReplacementNamed(context, '/+');
        }
      }
      else{
        Navigator.pushReplacementNamed(context, '/-');
      }
    }
    else
    {
      if(intro==true){
        Navigator.pushReplacementNamed(context, '/+');
      }
      else{
        Navigator.pushReplacementNamed(context, '/-');
      }
    }
  });

}
void introShr()async{
  SharedPreferences shr=await SharedPreferences.getInstance();
  shr.setBool('introDone', true);
}
Future<bool?> readIntroShr()async{
  SharedPreferences shr = await SharedPreferences.getInstance();
  var intro = shr.getBool('introDone');
  return intro;
}
