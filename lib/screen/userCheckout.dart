import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:shopjoy/screen/globalWidget/globalWidget.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Checkout Item"),
          backgroundColor: Colors.amberAccent,
        ),
        body: Column(
          children: <Widget>[
            _buildListProduct(),
            _buildListProduct(),
            _buildListProduct(),
            _buildProcessButton()
          ],
        ));
  }

  _buildListProduct() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
        child: Column(children: <Widget>[
              GFListTile(
            avatar: CircleAvatar(
              backgroundImage: AssetImage('lib/assets/img/as.png'),
              radius: 40,
            ),
            titleText: 'Product title',
            subtitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
            icon: GFToggle(
              onChanged: (val) {},
              value: null,
              enabledTrackColor: Colors.amberAccent,
            )),
            Container(
            alignment: Alignment.centerRight,
            child : Text("IDR. 2.000.000",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
            )
        ],) );
  }

  _buildProcessButton() {
    return GlobalWidget().actionButton(context, "PROCESS", (){}, Colors.amberAccent);
  }

  
} 
