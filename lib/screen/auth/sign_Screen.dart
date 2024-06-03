import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter_app/service/authSrevice.dart';
import '../../constant/customButton.dart';
import '../../constant/custom_input.dart';


enum Auth{
  signin,
  signup,
}

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  Auth _auth = Auth.signup;
  final _signupformkey  = GlobalKey<FormState>();
  final _signinformkey  = GlobalKey<FormState>();
  final AuthService auth = AuthService();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password  =TextEditingController();
  final TextEditingController _name = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    _email.dispose();
    _password.dispose();
    _name.dispose();
  }
  void signupuser(){
  auth.signup(context: context, name: _name.text, email: _email.text, password: _password.text);
  }
  void signinuser(){
  auth.signin(context: context, email: _email.text, password: _password.text);
  }


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        //backgroundColor: GlobalVariables.greyBackgroundCOlor,
        body: SafeArea(

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Text('WELCOME',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold,),),
                  Container(
                    child: Column(
                      children: [
                        Icon(CupertinoIcons.news,size: 140,color: Colors.purpleAccent,),
                        Text('News Note',style: TextStyle(fontSize: 30),)
                      ],
                    ),

                  ),
                  SizedBox(height: 20,),
                  ListTile(
                    tileColor: _auth==Auth.signup? Colors.grey:Colors.black12,
                    title: Text(
                      'Create Account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    leading: Radio(
                     // activeColor: GlobalVariables.secondaryColor,
                      value: Auth.signup,
                      groupValue: _auth,
                      onChanged: (Auth? val){
                        setState(() {
                          _auth = val!;
                        });
                      },
                    ),
                  ),
                  if(_auth == Auth.signup)
                    Form(
                      key: _signupformkey,
                      child: Column(
                        children: [
                          CustomTextField(controller: _email, hintText: 'email'),
                          SizedBox(height: 10,),
                          CustomTextField(controller: _name, hintText: 'name'),
                          SizedBox(height: 10,),
                          CustomTextField(controller: _password, hintText: 'password'),
                          SizedBox(height: 10,),
                          CustomButton(text: 'Sign-Up',
                            onTap: (){
                              // if(_signupformkey.currentState!.validate()){
                              signupuser();
                              //}
                            },
                          )
                        ],
                      ),
                    ),
                  ListTile(
                    tileColor: _auth==Auth.signin? Colors.grey:Colors.black12,

                    title: Text(
                      'Sign-IN.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    leading: Radio(
                      //activeColor: GlobalVariables.secondaryColor,
                      value: Auth.signin,
                      groupValue: _auth,
                      onChanged: (Auth? val){
                        setState(() {
                          _auth = val!;
                        });
                      },
                    ),
                  ),
                  if(_auth == Auth.signin)
                    Form(
                      key: _signinformkey,
                      child: Column(
                        children: [
                          CustomTextField(controller: _email, hintText: 'email'),
                          SizedBox(height: 10,),
                          CustomTextField(controller: _password, hintText: 'password'),
                          SizedBox(height: 10,),
                          CustomButton(text: 'Sign-in', onTap: (){
                            if(_signinformkey.currentState!.validate()){
                              signinuser();
                            }
                          } )
                        ],
                      ),
                    ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Spacer(),
                      TextButton(
                          onPressed: (){},
                          child: Text('Forget ?',style: TextStyle(fontSize: 20,color: Colors.black87,),selectionColor: Colors.purpleAccent,)
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}
