import 'package:flutter/material.dart';
import 'package:gmail_login_ui/screens/signup_page.dart';
import 'package:http/http.dart' as http;
import 'home.dart';


class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username.dispose();
    password.dispose();
    super.dispose();
  }



  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:SafeArea (
        child: Column(
          children: [
            SizedBox(height: 170),
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
                  controller: username,
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
                    borderRadius: const BorderRadius.only(
                      topLeft: const Radius.circular(5),
                      topRight: const Radius.circular(5),
                    ),
                  ),
                  )
              ),
            SizedBox(height: 0.2),
            Align(
                alignment: Alignment.center,
                child: Container(
                  height:52,
                  width: 355,
                  child: TextField(
                    controller: password,
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
                      // onSaved: (value) {
                      //   password = value;
                      // }
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: const Radius.circular(5),
                        bottomRight: const Radius.circular(5),
                    ),
                    ),


                  ),
                ),
            SizedBox(height: 10),
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
                    child: Text('Log In',
                      style: TextStyle(
                          fontSize: 20,
                          color: const Color(0xFFDDE8F2),
                      fontWeight: FontWeight.normal),
                    ),
                    onPressed: () async{

                      final url = 'http://10.0.2.2:8000/api/login/';
                      final response = await http.post(url, body:{'username': username.text, 'password': password.text});
                      if (response.statusCode == 200)
                        {
                          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Home(username.text)));
                        }
                      else
                        {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                // Retrieve the text the that user has entered by using the
                                // TextEditingController.
                                content: Text("Invalid Credentials"),
                              );
                            },
                          );

                        }


                    },


                )

                )
            ),
            SizedBox(height: 160),
            Align(
                alignment: Alignment.center,
                child: Container(
                  color: const Color(0xFF3A5998),
                  child: GestureDetector(
                    onTap: () {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );},
                    child: Text("Sign Up for Facebook",
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xFFF1FFFF),
                          fontSize: 17,
                          fontWeight: FontWeight.normal
                      ),
                    ))
                )),
            SizedBox(height: 40),
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