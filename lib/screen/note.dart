import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:news_flutter_app/screen/newscard.dart';
import 'package:news_flutter_app/service/notesrvice.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/const.dart';
import '../pathProvider/pathProvider.dart';
import '../service/authSrevice.dart';


String uri = 'http://192.168.103.177:4000';

class NodeScreen extends StatefulWidget {
  const NodeScreen({super.key});

  @override
  State<NodeScreen> createState() => _NodeScreenState();
}

class _NodeScreenState extends State<NodeScreen> {
  late String user_id;
  final NotesService service = NotesService();
  TextEditingController _headline = TextEditingController();
  TextEditingController _des = TextEditingController();
  List? items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchNode();
  }

  void SaveNote() {
    service.savenote(context: context,
        user_id: user_id,
        headline: _headline.text,
        des: _des.text,
        date: "${DateTime
            .now()
            .day}-${DateTime
            .now()
            .month}-${DateTime
            .now()
            .year}");
  }

  void FetchNode() async {
    // service.fetchnotes(context: context);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('x-auth-token');
    if (token != null) {
      Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(token);
      user_id = jwtDecodedToken['id'];
      http.Response res = await http.post(
        Uri.parse('$uri/api/fetch_notes'),
        body: jsonEncode({
          "user_id": user_id,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      var Rres = jsonDecode(res.body);
      items = Rres['success'];
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {

          });
      setState(() {

      });
    }

  }

  void deleteitem(String id) async{
    print('*******************************$uri/api/deletenotes$id');
    http.Response res = await http.delete(
      Uri.parse('$uri/api/deletenotes$id'),
      //   headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
    );

    httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
              showSnackBar(context, "Note deleted successfully");
        });

    FetchNode();
    setState(() {

    });

  }


  @override
  Widget build(BuildContext context) {
    var user = Provider
        .of<UserProvider>(context)
        .user;

    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                Text('Note headline', style: TextStyle(
                    fontSize: 30.0, fontWeight: FontWeight.w700),),
                SizedBox(height: 8.0),
                Text(items == null ? "Total Notes : 0" : "Total Notes : ${items!.length}",
                  style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: items == null ? Center(
                  child: CircularProgressIndicator(),)
                    : ListView.builder(
                    itemCount: items!.length,
                    itemBuilder: (context, int index) {
                      return Slidable(
                        key: const ValueKey(0),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          dismissible: DismissiblePane(
                              onDismissed: () {

                              }),
                          children: [
                            SlidableAction(
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                              onPressed: (BuildContext context) {
                                var iid  = items![index]['_id'];
                                 print(items);
                                items?.removeWhere((element) => element["_id"] == iid);
                                print(items);
                                deleteitem('${iid}');

                               },
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            _displaynewsDialog(context, index);
                          },
                          child: Card(
                            borderOnForeground: false,
                            child: ListTile(
                              leading: Icon(Icons.task),
                              title: Text('${items![index]['headline']}'),
                              subtitle: Text('${items![index]['des']}'),
                              trailing: Icon(Icons.arrow_back),
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayTextInputDialog(context),
        child: Icon(Icons.add),
        tooltip: 'Add-News',
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              icon: Icon(CupertinoIcons.news, color: Colors.black87,),
              title: Text('Add-News'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  TextField(
                    maxLines: 2,
                    controller: _headline,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Title",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)))),
                  ),
                  SizedBox(height: 5,),
                  TextField(
                    maxLines: 3,
                    controller: _des,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Description",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)))),
                  ),
                  ElevatedButton(onPressed: () {
                    SaveNote();
                    FetchNode();
                    Navigator.pop(context);

                  }, child: Text("Add"))
                ],
              )
          );
        });
  }




  Future<void> _displaynewsDialog(BuildContext context, int index) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              icon: Icon(CupertinoIcons.news, color: Colors.black87,),
              title: Text('Add-News'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${items![index]['headline']}', style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 30),maxLines: 3,),
                  SizedBox(height: 5,),
                  Text('${items![index]['des']}', style: TextStyle(
                      fontWeight: FontWeight.w300, fontSize: 25),),
                  SizedBox(height: 20,),
                  Text('${items![index]['date']}', style: TextStyle(
                      fontWeight: FontWeight.w300, fontSize: 20),),
                  SizedBox(height: 5,),

                ],
              )
          );
        });
  }
}

