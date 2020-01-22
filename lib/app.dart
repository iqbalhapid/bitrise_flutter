import 'package:flutter/material.dart';
import 'package:shopjoy/screen/landingPage.dart';

class App extends StatelessWidget {
  
  Widget _appChild(){
    return MaterialApp(
      title: 'Shop Joy',
      initialRoute: '/landingPage',
      onGenerateRoute: _getRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _appChild(),
    );
  }
}

Route<dynamic> _getRoute(RouteSettings setting){
  switch (setting.name){
    case '/landingPage' :
    return MaterialPageRoute(builder: (_) => Scaffold(body: LandingPage()));
  default :
    return null;
  }
}