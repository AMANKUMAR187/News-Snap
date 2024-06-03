
//
//    https://newsdata.io/api/1/latest?apikey=pub_449074eca97b8d60d79d12f56986e70787c26 &q=pegasus&language=en
//   https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=5a4c1c19ba84469abc002835514eb518
  import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:news_flutter_app/model/newsart.dart';
 

class fetchnews{
  static List sourcesId = [
    "abc-news",

    "bbc-news",
    "bbc-sport",

    "business-insider",

    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",

    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",

    "medical-news-today",

    "national-geographic",

    "news24",
    "new-scientist",

    "new-york-magazine",
    "next-big-future",

    "techcrunch",
    "techradar",

    "the-hindu",

    "the-wall-street-journal",

    "the-washington-times",
    "time",
    "usa-today",

  ];

static  Future<newsart> fetchn(String? type) async{
  print("************$type");
  final _random = new Random();
  var source = sourcesId[_random.nextInt(sourcesId.length)];
   Response response;
   if(type == 'india'){
     print("1");
     response = await get(
        Uri.parse(
            "https://newsapi.org/v2/top-headlines?country=in&apiKey=5a4c1c19ba84469abc002835514eb518")
    );
  }
   else if(type=='tech'){
     response = await get(
         Uri.parse(
             "https://newsapi.org/v2/top-headlines?sources=techradar&apiKey=5a4c1c19ba84469abc002835514eb518")
     );
   }
   else if(type=='hindu'){
     response = await get(
         Uri.parse(
             "https://newsapi.org/v2/top-headlines?sources=the-hindu&apiKey=5a4c1c19ba84469abc002835514eb518")
     );
   }
   else if(type=='bbc'){
     response = await get(
         Uri.parse(
             "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=5a4c1c19ba84469abc002835514eb518")
     );
   }
   else if(type=='business'){
     response = await get(
         Uri.parse(
             "https://newsapi.org/v2/top-headlines?sources=business-insider&apiKey=5a4c1c19ba84469abc002835514eb518")
     );
   }
   else if(type=='entertainment'){
     response = await get(
         Uri.parse(
             "https://newsapi.org/v2/top-headlines?sources=entertainment-weekly&apiKey=5a4c1c19ba84469abc002835514eb518")
     );
   }
   else if(type=='sports'){
     response = await get(
         Uri.parse(
             "https://newsapi.org/v2/top-headlines?sources=bbc-sport&apiKey=5a4c1c19ba84469abc002835514eb518")
     );
   }
   else if(type=='travel'){
     response = await get(
         Uri.parse(
             "https://newsapi.org/v2/top-headlines?sources=national-geographic&apiKey=5a4c1c19ba84469abc002835514eb518")
     );
   }
   //news24
   else if(type=='news24'){
     response = await get(
         Uri.parse(
             "https://newsapi.org/v2/top-headlines?sources=news24&apiKey=5a4c1c19ba84469abc002835514eb518")
     );
   }
  else {
     response = await get(
        Uri.parse(
            "https://newsapi.org/v2/top-headlines?sources=$source&apiKey=5a4c1c19ba84469abc002835514eb518")
    );
  }
Map body_data = jsonDecode(response.body);

List articles = body_data["articles"];

final _newrandom = new Random();
var myarticle = articles[_newrandom.nextInt(articles.length)];
  return  newsart.fromapi_to_app(myarticle);
}



}
