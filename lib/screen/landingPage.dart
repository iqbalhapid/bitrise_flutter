import 'package:flutter/material.dart';
import 'package:shopjoy/screen/globalWidget/globalWidget.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: globalWidget.background(Colors.black87, Colors.deepPurple, Colors.lightBlue, Colors.deepOrange),
          child: Column(
            children: <Widget>[globalWidget.logoApp('lib/assets/img/logo_joycash.png', null, null),
                      globalWidget.sizedBox(300, 0),
                      globalWidget.button(context, 'LOGIN', '/loginPage'), 
                      globalWidget.sizedBox(10, 0),
                      globalWidget.button(context, 'REGISTER', '/registerPage'), 
                      globalWidget.copyRight()],
          ),
        ));
  }

  final globalWidget = new GlobalWidget();
    
}
