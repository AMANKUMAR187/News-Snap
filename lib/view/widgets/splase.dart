import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splace extends StatelessWidget {
  const splace({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:  BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/images/new_splase.jpg"),
                opacity: 0.4,
            fit: BoxFit.cover,
          ),
        ),
      child: Column(
        children: [

           SizedBox(height: 300,),
          Icon(
               CupertinoIcons.news,
                size: 250,
            color: Colors.white70,
          ),
          SizedBox(height: 30,),
          Text('NEWS-X',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),

        ],
      ),


    );
  }
}
