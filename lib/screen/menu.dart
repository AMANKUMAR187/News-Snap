import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter_app/view/home.dart';



class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {

    return
         Scaffold(
           appBar: AppBar(
             title: Text('Select Content',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
             backgroundColor: Colors.purpleAccent,
           ),
           body: SingleChildScrollView(
               padding: EdgeInsets.all(5),
             child: Column(
               children: [
                 SizedBox(height: 15,),
                 getwid('Travelling', Icons.travel_explore,'travel.jpg',Homepage(typee: 'travel',) ),
                 SizedBox(height: 15,),
                 getwid('Business', Icons.business,'business.jpg',Homepage(typee: 'business')),
                 SizedBox(height: 15,),
                 getwid('Technology', Icons.tab,'tech.jpg',Homepage(typee: 'tech')),
                 SizedBox(height: 15,),
                 getwid('Entertainment', Icons.book,'entertainment.jpg',Homepage(typee: 'entertainment')),
                 SizedBox(height: 15,),
                 getwid('India', Icons.travel_explore,'india.jpg',Homepage(typee: 'india')),
                 SizedBox(height: 15,),
                 getwid('The-Hindu', Icons.fastfood,'new_splase.jpg',Homepage(typee: 'hindu')),
                 SizedBox(height: 15,),
                 getwid('BBC News', Icons.medical_services,'new_splase.jpg',Homepage(typee: 'bbc')),

               ],
             ),
           ),
         );
  }
  Widget getwid(String type, IconData iconData,String image,Widget widget){
    return GestureDetector(
      onTap:  (){
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> widget));
      },
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.grey,
          image: DecorationImage(
            image: AssetImage("assets/images/$image"),
            opacity: 0.6,
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        height: 150,
        child: Center(child: Text(type,style: TextStyle(fontSize: 40,fontWeight : FontWeight.bold,color: Colors.black87,),)),
          

      ),
    );
  }

}
