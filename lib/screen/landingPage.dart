import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Landing Page'),
          backgroundColor: Colors.black87,
        ),
        body: Container(
          decoration: background,
          child: Column(
            children: <Widget>[logoApp, loginRegister, copyright],
          ),
        ));
  }

  final loginRegister = Container(
      margin: EdgeInsets.only(top: 250),
      child: Column(
        children: <Widget>[
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: BorderSide(color: Colors.white, width: 5)),
              color: Colors.deepOrange,
              // padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
              minWidth: 300,
              height: 70,
              onPressed: () => {},
              child: Text(
                'LOGIN',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: BorderSide(color: Colors.white, width: 5)),
              color: Colors.deepOrange,
              // padding: EdgeInsets.fromLTRB(90, 20, 90, 20),
              minWidth: 300,
              height: 70,
              onPressed: () => {},
              child: Text(
                'REGISTER',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ));

  final copyright =
      Container(
        margin: EdgeInsets.only(top: 60),
        child: Text('Copyright \u00a9 JoyShop by Iqbal & Brian est. 2020',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),)
        );

  final logoApp = Container(
      margin: EdgeInsets.only(left: 30, top: 20),
      child: Center(
        child: Image(
          image: AssetImage('lib/assets/img/logo_joycash.png'),
        ),
      ));

  final background = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Colors.black87,
        Colors.deepPurple,
        Colors.lightBlue,
        Colors.deepOrange
      ],
    ),
  );
}
