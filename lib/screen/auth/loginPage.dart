import 'package:flutter/material.dart';
import 'package:shopjoy/api/apiServices.dart';
import 'package:shopjoy/screen/globalWidget/globalWidget.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email;
  String _password;

  final globalWidget = new GlobalWidget();

  Widget _bodyLogin() {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black45,
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(45),
          child: ListView(
            children: <Widget>[
              globalWidget.sizedBox(120, 0),
              Form(
                key: _formkey,
                autovalidate: _autoValidate,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: TextFormField(
                          validator: RequiredValidator(errorText: 'Required'),
                          onChanged: (text) => _email = text,
                          style: TextStyle(color: Colors.white),
                          decoration: globalWidget.inputDecoration(
                              Colors.white, Colors.white, 'Email', 15)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: TextFormField(
                          validator: RequiredValidator(errorText: 'Required'),
                          obscureText: true,
                          onChanged: (text) => _password = text,
                          style: TextStyle(color: Colors.white),
                          decoration: globalWidget.inputDecoration(
                              Colors.white, Colors.white, 'Password', 15)),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: globalWidget.actionButton(
                      context, 'LOGIN', validateInputs, Colors.lightGreen)),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account? "),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/registerPage');
                      },
                      child: Text('Register',
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold)))
                ],
              ),
              //_tryToLogin(model.appState)
            ],
          ),
        ),
      ),
    );
  }

  validateInputs() async {
    if (_formkey.currentState.validate()) {
      // _formkey.currentState.save();
      try {
        await tryLogin.postLogin(_email, _password);
      } catch (err) {
        return globalWidget.showAlert(
            context, 'failed login', 'try again', false);
      }

      if (tryLogin.resJson != null) {
        return Navigator.of(context).pushNamed('/dashboard');
      }
      return globalWidget.showAlert(
          context, 'failed login', 'try again', false);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  final tryLogin = FetchApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: globalWidget.background(
                Colors.greenAccent, Colors.grey, Colors.white, Colors.lime),
            child: _bodyLogin()));
  }
}
