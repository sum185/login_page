import 'package:flutter/material.dart';
import 'package:login_page/screen/provider/login_provider.dart';
import 'package:login_page/utils/share_pref.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController txtemail= TextEditingController();
  TextEditingController txtfname= TextEditingController();
  TextEditingController txtlname= TextEditingController();
  TextEditingController txtcpass= TextEditingController();
  TextEditingController txtpass= TextEditingController();
  LoginProvider? providerT;
  LoginProvider? providerF;
  @override
  Widget build(BuildContext context) {
    providerT = Provider.of(context, listen: true);
    providerF = Provider.of(context, listen: false);
    return SafeArea(child: Scaffold(
      body: Form(
        key: providerT!.key2,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.teal.shade600
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(blurRadius: 2)
                ]
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("TaskMe",style: TextStyle(color: Colors.teal,fontSize: 50),),
                      SizedBox(height: 20,),
                      TextField(
                        controller: txtfname,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            hintText: "First name",
                          hintStyle: TextStyle(color: Colors.black)
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        controller: txtlname,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            hintText: "Last name",
                            hintStyle: TextStyle(color: Colors.black)
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: txtemail,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.black)
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter username";

                          }
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: txtpass,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.black)
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter password";

                          }
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: txtpass,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            hintText: "Confirm password",
                            hintStyle: TextStyle(color: Colors.black)
                        ),
                      ),
                      SizedBox(height: 50,),
                      InkWell(
                        onTap: (){
                          if (providerT!.key2.currentState!.validate()){
                            CreateShr(txtemail.text, txtpass.text);
                            Navigator.pushReplacementNamed(context, '/+');
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
                                BoxShadow(blurRadius: 2,color: Colors.black)
                              ]
                          ),
                          child: Center(
                            child: Text("Sign up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Already have account?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          TextButton(onPressed: (){
                            Navigator.pushReplacementNamed(context, '/+');
                          }, child: Text("Sign in",style: TextStyle(color: Colors.blue,fontSize: 20,decoration: TextDecoration.underline),))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
