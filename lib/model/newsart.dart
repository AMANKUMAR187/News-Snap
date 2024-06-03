


class newsart {
  String imgurl;
  String newshead;
  String newsdes;
  String newscnt;
  String newsurl;

  newsart({
    required this.imgurl,
    required this.newsdes,
    required this.newshead,
    required this.newsurl,
    required this.newscnt,
});
static  fromapi_to_app(Map<String,dynamic> article){
   return newsart(
       imgurl: article["urlToImage"]?? "https://th.bing.com/th/id/OIP.i6JxB9kI465laPiJ9ZwYtAHaIV?w=147&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
           newsdes: article["description"]?? " oops not available.......",
       newshead: article["title"]?? " oops not available........",
       newsurl: article["url"]?? "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
       newscnt: article["content"]?? " oops not available........"
   );
}

}