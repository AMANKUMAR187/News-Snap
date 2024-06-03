import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class detailviewscreen extends StatefulWidget {
  String url1;
  detailviewscreen({required this.url1,super.key});

  @override
  State<detailviewscreen> createState() => _detailviewscreenState();
}

class _detailviewscreenState extends State<detailviewscreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      widget.url1 = widget.url1.contains("http")?
      widget.url1.replaceAll("http:","https:"):
      widget.url1;
    });
  }

  //late WebViewController controller
  late final controller = WebViewController()
 ..setJavaScriptMode(JavaScriptMode.unrestricted)
 ..loadRequest(Uri.parse(widget.url1));

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'News app',
           style: TextStyle(
            color: Colors.white,
        ),
        ),
      ),
         body: Center(
           child:WebViewWidget(
             controller: controller,
           ),
         ),

    );

  }
}

