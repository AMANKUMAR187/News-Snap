import 'dart:core';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter_app/view/widgets/detail_view.dart';




class newscontainer extends StatefulWidget {
  String imgurl;
  String newshead;
  String newsdes;
  String newscnt;
  String newsurl;


   newscontainer({super.key ,
    required this.imgurl,
    required this.newsdes,
    required this.newshead,
     required this.newscnt,
    required this.newsurl,
  });

  @override
  State<newscontainer> createState() => _newscontainerState();
}


class _newscontainerState extends State<newscontainer> {
   @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.all(10),
          height : MediaQuery.of(context).size.height,
          width : MediaQuery.of(context).size.width,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              height:  250,
              width:  MediaQuery.of(context).size.width,
              placeholder: 'assets/images/news.png' ,
              image: widget.imgurl,

          ),

          // Image.network(imgurl,
          //

          // ),
          SizedBox(height: 20,),
          Text( widget.newshead,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
          ),

          SizedBox(height: 6 ,),
          Text( widget.newsdes,
           maxLines: 4,
           overflow: TextOverflow.ellipsis,
           style: TextStyle(
             fontSize: 14,
             color: Colors.black38,
           ),
          ),
          SizedBox(height: 6 ,),


             SingleChildScrollView(

              scrollDirection: Axis.vertical,
              child: Center(
                child: Text(
                  widget.newscnt,
                   maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),



          SizedBox(height: 10 ,),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> detailviewscreen(url1: widget.newsurl ,)));
                  },

                  child:  Text('Read More'),
              )
            ],
          ),
          SizedBox(height: 20,),

        ],
      ),

    );
  }
}
