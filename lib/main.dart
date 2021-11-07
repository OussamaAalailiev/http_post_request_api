import 'package:flutter/material.dart';
import 'package:http_post_request_api/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_post_request_api/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter->> Http Post Request api'),
    );
  }
}
