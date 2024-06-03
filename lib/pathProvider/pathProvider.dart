import 'package:flutter/material.dart';
import 'package:news_flutter_app/model/user.dart';

class UserProvider extends ChangeNotifier {

  User _user = User(id: "", name: "", email:"", password: "", token: "");

  User get user=>_user;
  void setuser(String user){
    _user = User.fromJson(user);
    notifyListeners();
  }


}