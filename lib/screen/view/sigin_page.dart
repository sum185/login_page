import 'package:flutter/material.dart';
import 'package:login_page/screen/provider/login_provider.dart';
import 'package:login_page/utils/share_pref.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpass = TextEditingController();
  LoginProvider? providerT;
  LoginProvider? providerF;

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of(context, listen: true);
    providerF = Provider.of(context, listen: false);
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.teal.shade400,
            child: SingleChildScrollView(
              child: Form(
                key: providerT!.key,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("TaskMe",style: TextStyle(color: Colors.white,fontSize: 50),),
                    ),
                    SizedBox(height: 50,),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 450,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(blurRadius: 3)
                            ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    controller: txtemail,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                        ),
                                        hintText: "Username",
                                        hintStyle: TextStyle(color: Colors.black87),
                                        suffixIcon: Icon(
                                          Icons.person, color: Colors.black87,)
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter username";

                                      }
                                    },
                                  ),
                                  SizedBox(height: 20,),
                                  TextFormField(
                                    controller: txtpass,
                                    decoration: InputDecoration(

                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                        ),
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.black),
                                        suffixIcon: Icon(
                                          Icons.lock, color: Colors.black,)
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Password";
                                      }
                                    },
                                  ),
                                  SizedBox(height: 100,),
                                  InkWell(
                                    onTap: () async {
                                      String? e1 = await readEmailPref();
                                      String? p1 = await readPasseordPref();
                                      if (providerT!.key.currentState!.validate()){
                                        if(e1 != txtemail.text || p1!=txtpass.text) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong Username Or Password")));
                                        }
                                        else
                                        {
                                          IsLogin(true);
                                          Navigator.pushReplacementNamed(
                                              context, 'h');
                                        }
                                      }
                                      else{
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Username Or Password")));
                                      }
                                    },
                                    child: Container(
                                      height: 60,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          color: Colors.teal,
                                          borderRadius: BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 2, color: Colors.black)
                                          ]
                                      ),
                                      child: Center(
                                        child: Text("Sign in", style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 50,),
                                  Row(
                                    children: [
                                      Text("Don't have account?",
                                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      TextButton(onPressed: () {
                                        Navigator.pushReplacementNamed(context, '/++');
                                      },
                                          child: Text("Sign up", style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 20,
                                              decoration: TextDecoration.underline),))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
