import 'package:flutter/material.dart';
import 'package:login_page/screen/provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'screen/view/home_page.dart';
import 'screen/view/intro_page.dart';
import 'screen/view/logo_page.dart';
import 'screen/view/sigin_page.dart';
import 'screen/view/signup_page.dart';
void main()
{
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LoginProvider(),)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/':(context) => LogoPage(),
            '/-':(context) => IntoPage(),
            '/+':(context) => SigninPage(),
            '/++':(context) => SignupPage(),
            'h':(context) => HomePage(),
          },
        ),
      )
  );
}