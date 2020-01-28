import 'package:flutter/material.dart';
import 'package:shopjoy/screen/landingPage.dart';
import 'package:shopjoy/screen/auth/loginPage.dart';
import 'package:shopjoy/screen/auth/registerPage.dart';
import 'package:shopjoy/screen/homePage.dart';
import 'package:shopjoy/screen/globalWidget/productDetail.dart';
import 'package:shopjoy/screen/globalWidget/splashscreen.dart';
import 'package:shopjoy/screen/userChart.dart';

class App extends StatelessWidget {
  
  Widget _appChild(){
    return MaterialApp(
      title: 'Shop Joy',
      initialRoute: '/splashScreen',
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
    case '/splashScreen' :
    return MaterialPageRoute(builder: (_) => Scaffold(body: SplashScreen()));
    case '/landingPage' :
    return MaterialPageRoute(builder: (_) => Scaffold(body: LandingPage()));
    case '/loginPage' :
    return MaterialPageRoute(builder: (_) => Scaffold(body: LoginPage()));
    case '/registerPage' :
    return MaterialPageRoute(builder: (_) => Scaffold(body: RegisterPage()));
    case '/homePage' :
    return MaterialPageRoute(builder: (_) => Scaffold(body: HomePage()));
    case '/productDetail' : 
    return MaterialPageRoute(builder: (_) => Scaffold(body: ProductDetailPage()));
    case '/chartPage' : 
    return MaterialPageRoute(builder: (_) => Scaffold(body: CartPage()));
  default :
    return null;
  }
}