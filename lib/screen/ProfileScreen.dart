import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter_app/pathProvider/pathProvider.dart';
import 'package:news_flutter_app/screen/auth/sign_Screen.dart';
import 'package:provider/provider.dart';

import '../service/authSrevice.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthService().getuserdata(context);

  }


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
   print(user.name.toString());


    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    child: Icon(CupertinoIcons.person_crop_circle_fill,size: 200,)),
                SizedBox(height: 15,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purpleAccent),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                 child: Padding(
                   padding: EdgeInsets.all(6),
                   child: Row(
                     children: [
                       Text('Name  :  ',style: TextStyle(fontSize: 30),),
                       Text(user.name.toUpperCase() , style: TextStyle(fontSize: 30),)
                     ],
                   ),
                 ),                 
                ),
                SizedBox(height: 15,),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purpleAccent),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Text('Email  :  ',style: TextStyle(fontSize: 30),),
                            Text(user.email , style: TextStyle(fontSize: 30),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
               Spacer(),
               ElevatedButton(
                   onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignScreen()));
                   },
                   child: Text('LOG-OUT',style: TextStyle(fontSize: 20),))

              ],
            ),
          ),
        ),
      appBar: AppBar(
        title: Text('Profil',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 40),),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
      ),
    );
  }
}
