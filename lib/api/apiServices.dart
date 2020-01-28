import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shopjoy/screen/auth/registerPage.dart';

class FetchApi with ChangeNotifier {
  FetchApi();
  Dio dio = new Dio();
  String resJson = '';
  bool _isFetching = false;

  void setResJson(String resJson) {
    resJson = resJson;
    notifyListeners();
  }

  void isFetch(bool isFetching) async {
    _isFetching = isFetching;
    notifyListeners();
  }

  String get getResJson => resJson;
  bool get isFetching => _isFetching;

  Future<void> postRegist(String email, String username, String password) async {
    String baseUrl = 'https://travisci-heroku.herokuapp.com';
    _isFetching = true;
    notifyListeners();

    final res = await dio.post('$baseUrl/user/register',
        data: {"email": email, "username": username, "password": password});
    resJson = res.data.toString();

    _isFetching = false;
    notifyListeners();
    print(resJson);
    return resJson;
  }

  Future postLogin(String email, String password) async {
    String baseUrl = 'https://travisci-heroku.herokuapp.com';
    final res = await dio.post('$baseUrl/user/login',
        data: {"email": email, "password": password});
    resJson = res.data.toString();
    print(resJson);
    return resJson;
  }
}
