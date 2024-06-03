import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:news_flutter_app/model/notes.dart';
import 'package:provider/provider.dart';

import '../constant/const.dart';
import '../pathProvider/pathProvider.dart';

String uri = 'http://192.168.103.177:4000';

class NotesService{
  void savenote  ({
    required BuildContext context,
    required String user_id,
    required String headline,
    required String des,
    required String date,
  }) async{
    try{
       Note note = Note(id: '', user_id: user_id, headline: headline, des: des, date: date);
       print(note);
       http.Response res =  await http.post(
        Uri.parse('$uri/api/save_note'),
        body: note.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: (){
            showSnackBar(context , "Note Saved successfully ");
          });

    }
    catch(err){
      showSnackBar(context, err.toString());
    }
  }






  void DeleteNode ({
     required String user_id,
    required String id,
   })async{

  }




}

