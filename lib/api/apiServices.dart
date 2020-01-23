import 'package:dio/dio.dart';

class FetchApi {
  Dio dio = new Dio();
  String resJson;

  Future postRegist(String email, String username, String password) async {
    String baseUrl = 'https://travisci-heroku.herokuapp.com';
    final res = await dio.post('$baseUrl/user/register', data: {
      "email" : email,
      "username" : username,
      "password" : password
    });
    resJson = res.data.toString();
    print(resJson);
    return resJson;
  }

  Future postLogin(String email, String password) async {
    String baseUrl = 'https://travisci-heroku.herokuapp.com';
    final res = await dio.post('$baseUrl/user/login', data: {
      "email" : email,
      "password" : password
    });
    resJson = res.data.toString();
    print(resJson);
    return resJson;
  }
}