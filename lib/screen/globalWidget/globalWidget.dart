import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class GlobalWidget {
  Widget button(BuildContext context, String title, String nav) {
    return MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(color: Colors.white, width: 5)),
        color: Colors.deepOrange,
        minWidth: 300,
        height: 70,
        onPressed: () {
          Navigator.pushNamed(context, nav);
        },
        child: Text(
          title,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }

  Widget actionButton(BuildContext context, String title, Function action, Color color) {
    return MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(color: Colors.white, width: 5)),
        color: color,
        minWidth: 300,
        height: 70,
        onPressed: action,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }

  Widget sizedBox(double height, double width) {
    return SizedBox(height: height, width: width);
  }

  Widget copyRight() {
    return Container(
        margin: EdgeInsets.only(top: 60),
        child: Text(
          'Copyright \u00a9 JoyShop by Iqbal & Brian est. 2020',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ));
  }

  Widget logoApp() {
    return Container(
        margin: EdgeInsets.only(left: 30, top: 50),
        child: Center(
          child: Image(
            image: AssetImage('lib/assets/img/logo_joycash.png'),
          ),
        ));
  }

  background(Color color1, Color color2, Color color3, Color color4) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [color1, color2, color3, color4],
      ),
    );
  }

  inputDecoration(
      Color borderColor, Color labelColor, String labelText, double fontSize) {
    return InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: borderColor)),
        labelText: labelText,
        labelStyle: TextStyle(fontSize: fontSize, color: labelColor));
  }

  showAlert(BuildContext context, String title, String desc){
    Alert(
      context: context,
      type: AlertType.warning,
      title: title,
      desc: desc,
      buttons: [
        DialogButton(
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }
}
