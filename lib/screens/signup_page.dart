import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'login_page.dart';

class SignUp extends StatefulWidget {
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:SafeArea (
                child: Column(
                    children: [
                      SizedBox(height: 140),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              color: const Color(0xFF3A5998),
                              child: Text("facebook",
                                //textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 55,
                                    fontWeight: FontWeight.bold
                                ),

                              ))
                      ),
                      SizedBox(height: 20),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                            height:52,
                            width: 355,
                            child: TextField(
                              controller : username,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              showCursor: false,
                              //cursorColor: Colors.black45,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                                hintText: 'Username',
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)
                            ),
                          )
                      ),
                      SizedBox(height: 5),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                            height:52,
                            width: 355,
                            child: TextField(
                              controller : email,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              showCursor: false,
                              //cursorColor: Colors.black45,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                                hintText: 'Email',
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )
                      ),
                      SizedBox(height: 5),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height:52,
                          width: 355,
                          child: TextField(
                            controller : password,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            showCursor: false,
                            //cursorColor: Colors.black45,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 16),
                              hintText: 'Password',
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                          ),


                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFF4E6AA2),
                                  borderRadius: BorderRadius.all(
                                      const Radius.circular(5))
                              ),
                              height:52,
                              width: 355,
                              child: TextButton(
                                child: Text('Sign Up',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: const Color(0xFFDDE8F2),
                                      fontWeight: FontWeight.normal),
                                ),
                                onPressed: () async{
                                  final url = 'http://10.0.2.2:8000/api/register/';
                                  final response = await http.post(url, body: {'username':username.text, 'email':email.text, 'password':password.text});
                                  if (response.statusCode==200)
                                    {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text("Account registration is successful"),
                                          );
                                        },
                                      );
                                      await Future.delayed(Duration(seconds: 3));
                                      Navigator.of(context).push(MaterialPageRoute(builder:(context)=>LoginPage()));
                                    }
                                  else
                                    {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text("Invalid Credentials"),
                                          );
                                        },
                                      );

                                    }

                                },
                              )

                          )
                      ),
                      SizedBox(height: 140),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              color: const Color(0xFF3A5998),
                              child: Text("Need Help?",
                                //textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: const Color(0xFFF1FFFF),
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal
                                ),
                              ))
                      )
                    ]
                )
            )
        )
    );

  }

}
