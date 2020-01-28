import 'package:flutter/material.dart';
import 'package:shopjoy/screen/globalWidget/globalWidget.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shopjoy/api/apiServices.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool isLoading = false;
  String _email;
  String _username;
  String _password;

  final globalWidget = new GlobalWidget();

  Widget _bodyRegister() {
    final appState = Provider.of<FetchApi>(context, listen: true);
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
                      padding: padding,
                      child: TextFormField(
                          validator: emailValidator,
                          onChanged: (text) => _email = text,
                          style: TextStyle(color: Colors.white),
                          decoration: globalWidget.inputDecoration(
                              Colors.white, Colors.white, 'Email', 15)),
                    ),
                    Padding(
                      padding: padding,
                      child: TextFormField(
                          validator: usernameValidator,
                          onChanged: (text) => _username = text,
                          style: TextStyle(color: Colors.white),
                          decoration: globalWidget.inputDecoration(
                              Colors.white, Colors.white, 'Username', 15)),
                    ),
                    Padding(
                      padding: padding,
                      child: TextFormField(
                          validator: passwordValidator,
                          obscureText: true,
                          onChanged: (text) => _password = text,
                          style: TextStyle(color: Colors.white),
                          decoration: globalWidget.inputDecoration(
                              Colors.white, Colors.white, 'Password', 15)),
                    ),
                    Padding(
                      padding: padding,
                      child: TextFormField(
                          obscureText: true,
                          validator: (text) => MatchValidator(
                                  errorText: 'passwords do not match')
                              .validateMatch(text, _password),
                          style: TextStyle(color: Colors.white),
                          decoration: globalWidget.inputDecoration(Colors.white,
                              Colors.white, 'Retype Password', 15)),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: padding,
                  child: isLoading
                      ? globalWidget.loadingIndicator()
                      : globalWidget.actionButton(context, 'REGISTER',
                          validateInputs, Colors.lightBlue)),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  final padding = EdgeInsets.fromLTRB(0, 20, 0, 20);

  validateInputs() async {
    if (_formkey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      
      // _formkey.currentState.save();
      try {
        await tryRegist.postRegist(_email, _username, _password);
        // validateRegist();
      } catch (err) {
        return globalWidget.showAlert(
            context, 'failed register', 'try again', false);
      }
      
      setState(() {
        isLoading = false;
      });
      if (tryRegist.resJson != null) {
        return Navigator.of(context).pushNamed('/loginPage');
      }

      return isLoading;
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  // validateRegist() async {
  //   return FutureBuilder(
  //     future: Provider.of<FetchApi>(context, listen: false)
  //         .postRegist(_email, _username, _password),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         return Text(snapshot.data.toString());
  //       } else if (snapshot.hasError) {
  //         return Text("${snapshot.error}");
  //       } else {
  //         return Text('loading');
  //       }
  //     },
  //   );
  // }

  final tryRegist = new FetchApi();

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email cannot be empty'),
  ]);

  final usernameValidator = MultiValidator([
    RequiredValidator(errorText: 'Username cannot be empty'),
  ]);

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long')
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: globalWidget.background(
              Colors.lightBlue, Colors.grey, Colors.white, Colors.blueAccent),
          child: _bodyRegister()),
    );
  }
}
