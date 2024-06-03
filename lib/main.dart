import 'package:flutter/material.dart';
import 'package:news_flutter_app/pathProvider/pathProvider.dart';
import 'package:news_flutter_app/screen/auth/sign_Screen.dart';
import 'package:news_flutter_app/screen/note.dart';
import 'package:news_flutter_app/service/authSrevice.dart';
import 'package:news_flutter_app/view/home.dart';
import 'package:news_flutter_app/view/widgets/splase.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=> UserProvider(),),
  ],child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool showsplase = true;
  Leadhome(){
    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        showsplase = false;
      });
    });
  }
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Leadhome();
    AuthService().getuserdata(context);
    }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       home:
       Provider.of<UserProvider>(context).user.token.isNotEmpty?
        Homepage() : SignScreen() ,
    );
  }
}
