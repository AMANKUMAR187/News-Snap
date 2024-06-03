import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_flutter_app/pathProvider/pathProvider.dart';
import 'package:news_flutter_app/screen/homeScreen.dart';
import 'package:news_flutter_app/view/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/const.dart';
import '../model/user.dart';
import 'package:http/http.dart' as http;

String uri = 'http://192.168.103.177:4000';

class AuthService{
void signup({
  required BuildContext context,
  required String name,
  required String email,
  required String password,

}) async {
  try{
    User user = User(id: "", email: email, name: name, password: password,token:"");
     print('$uri/api/signup');
    http.Response res =  await http.post(
      Uri.parse('$uri/api/signup'),
      body: user.toJson(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  print("2");
    httpErrorHandle(
        response: res,
        context: context,
        onSuccess: (){
          showSnackBar(context , "Account created successfully !");
        });

  }
  catch(err){
        showSnackBar(context, err.toString());
  }
}

Future<void> signin({
 required BuildContext context,
  required String email,
  required String password,
}) async {

  http.Response res =  await http.post(
    Uri.parse('$uri/api/signin'),
    body: jsonEncode({
      'email' : email,
      'password' : password,
    }),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  httpErrorHandle(
    response: res,
    context: context,
    onSuccess: ()async{
        SharedPreferences pref = await SharedPreferences.getInstance();
        Provider.of<UserProvider>(context,listen: false).setuser(res.body);
        await pref.setString('x-auth-token',  jsonDecode(res.body)['token']);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
    },
  );
}

void getuserdata(
    BuildContext context,
    )async {
  try{

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token  = pref.getString('x-auth-token');
    if(token == null){
      pref.setString('x-auth-token', '');
    }
    print(token);

    var tokenres = await http.post(
      Uri.parse('$uri/tokenisvalid'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': token!
      },
    );

    var response = jsonDecode(tokenres.body);
    print(response);
    if(response == true){
      // get user data
      http.Response resonses  = await http.get(Uri.parse('$uri/u'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        },
      );
      print("***********************");
     print(resonses.body);
      var userprovider = Provider.of<UserProvider>(context,listen:  false);
      userprovider.setuser(resonses.body);
    }

  }
  catch(err){
    showSnackBar(context, err.toString());
  }

}


}