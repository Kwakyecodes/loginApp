import 'package:flutter/material.dart';
import 'login_page.dart';

class Home extends StatefulWidget {
  String username;
  Home(this.username);

  @override
  State<StatefulWidget> createState() {
    return HomeState(this.username);
  }
}
//   @override
//   HomeState createState() => HomeState();
// }

class HomeState extends State<Home> {
  String username;
  HomeState(this.username);

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:SafeArea (
                child: Column(
                    children: [
                      SizedBox(height: 200),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              color: const Color(0xFF3A5998),
                              child: Text("Welcome, $username",
                                //textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold
                                ),

                              ))
                      ),
                      SizedBox(height: 50),
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
                                child: Text('Log Out',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: const Color(0xFFDDE8F2),
                                      fontWeight: FontWeight.normal),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginPage()),
                                  );
                                },
                              )

                          )
                      ),
                    ]
                )
            )
        )
    );

  }

}
