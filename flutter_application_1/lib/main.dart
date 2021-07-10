
import 'package:flutter_application_1/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/globals.dart' as global;


void main() {
  runApp(App());
}

class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AppState();
      }
    }
    
class AppState extends State<App>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home:Scaffold(
        appBar: AppBar(
          title: Text('Yang ayam'),
          
        ),
        body:LoginPage(),
      )
      );
  }
}

