import 'package:flutter/material.dart';
import 'package:news_flutter_app/constant/customButton.dart';
import 'package:news_flutter_app/constant/custom_input.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
   final  TextEditingController forgetemail = TextEditingController();

   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    forgetemail.dispose();
  }

  @override
  Widget build(BuildContext context) {

     void forgetpassword(){

     }

    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text('Forget Password',style: TextStyle(fontSize: 30,),textAlign: TextAlign.center,),
                SizedBox(height: 30,),
                CustomTextField(controller: forgetemail, hintText: 'Registered-Email'),
                SizedBox(height: 20,),
                CustomButton(
                    text: 'Send-otp',
                    onTap: (){

                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
