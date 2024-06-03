import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter_app/screen/homeScreen.dart';
import 'package:news_flutter_app/screen/menu.dart';
import 'package:news_flutter_app/screen/note.dart';

import '../screen/ProfileScreen.dart';

class Homepage extends StatefulWidget {
   Homepage({super.key,this.typee});
   var typee;
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int initialpage = 0;
  List <Widget> widgetlist  = [
    HomeScreen(),
    NodeScreen(),
    MenuScreen(),
    ProfileScreen(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget temp;
    if(widget.typee!= null){
      var temp2 = widget.typee;
      widget.typee = null;
      temp = HomeScreen(typee: temp2,);

    }else{
      temp = widgetlist[initialpage];
    }

   return  Scaffold(

     body: Center(
       child:temp,
     ) ,

 bottomNavigationBar: CurvedNavigationBar(
    color: Colors.purple,
   backgroundColor: Colors.white70,
     onTap: (index){
      print(index);
       setState(() {
         initialpage = index;
       });
     },
   items: [
     Icon(Icons.home),
     Icon(Icons.note_alt,),
     Icon(Icons.apps_outage),
     Icon(Icons.person)
   ],
 ),
   );



   }
}
