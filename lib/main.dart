import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:my_contact_list/my_contact_list/features/search_contacts/presentation/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness:  Brightness.dark,
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        primaryColorLight: Colors.blue,
        primaryColorBrightness: Brightness.dark,
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      home: SplashScreen(),
    );
  }
}


/// Component UI
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

/// Component UI
class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;
  @override
  /// Setting duration in splash screen
  startTime() async {
    setState(() {
      _isVisible = true;
    });
    return new Timer(Duration(milliseconds: 4500), NavigatorPage);
  }
  /// To navigate layout change
  void NavigatorPage() async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) =>
            new HomePage()));
  }
  /// Declare startTime to InitState
  @override
  void initState() {
    super.initState();
    startTime();
  }
  /// Code Create UI Splash Screen
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        /// Set Background image in splash screen layout (Click to open code)
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/hogwarts cover2.jpg'), fit: BoxFit.none)),
        child: Container(
          /// Set gradient black in image splash screen (Click to open code)
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0.3),
                    Color.fromRGBO(0, 0, 0, 0.4)
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter)),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                    ),
                    /// Text header "Welcome To" (Click to open code)
                    Text(
                      "@Contacts",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Gotik",
                        fontSize: 19.0,
                      ),
                    ),
                    /// Animation text Treva Shop to choose Login with Hero Animation (Click to open code)

                    Hero(
                      tag: "Logo",
                      child: Image.asset(
                        '',
                        width: 120.0,
                        height: 120.0,

                      ),

                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}


