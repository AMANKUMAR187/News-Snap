import 'package:flutter/material.dart';
import 'package:news_flutter_app/controller/fetchnews.dart';
import '../model/newsart.dart';
import '../view/widgets/newscontainer.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key,this.typee});
  var typee;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isloading = true;
  late newsart newart1;



  getnews(String type)  async{
    newart1 = await fetchnews.fetchn(type);
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {

    getnews(widget.typee.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(widget.typee==null){
       widget.typee = 'News';
    }
    return Scaffold(

      body:  PageView.builder(
            controller:  PageController(initialPage: 0),
            scrollDirection: Axis.vertical,
            onPageChanged: (value){
              setState(() {
                isloading = true;
              });
              getnews(widget.typee.toString());
            },
            itemBuilder: (context , index){
              return
                isloading ? Center(
                  child: CircularProgressIndicator(),
                ):
                newscontainer(
                    imgurl: newart1.imgurl,
                    newscnt: newart1.newscnt,
                    newsdes: newart1.newsdes,
                    newshead: newart1.newshead,
                    newsurl: newart1.newsurl);
            }),

      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(widget.typee.toString().toUpperCase() ,style: TextStyle(fontSize: 25),),
      ),

    );
  }
}
