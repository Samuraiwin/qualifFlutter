import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/globals.dart' as global;
import 'package:flutter_application_1/views/login.dart';
import 'package:flutter_application_1/views/product.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

void _product(BuildContext ctx){
    Navigator.push(ctx,MaterialPageRoute(builder: (ctx){
      return MaterialApp(
        home: Scaffold(body: ListPage(),),
      );
    }));
}

void _logOut(BuildContext ctx){
  global.username="";
    Navigator.push(ctx,MaterialPageRoute(builder: (ctx){
      return MaterialApp(
        home: Scaffold(body: LoginPage(),),
      );
    }));
}

class HomeState extends State<HomePage>{

   var _images=[
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:global.theme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
      appBar: AppBar(title: Text(global.username),
      actions: [
            PopupMenuButton(itemBuilder: (context){
              return ['Toggle Theme'].map((e){
                return PopupMenuItem(child: TextButton(child: Text('Toggle Theme'),onPressed: (){
                  setState(() {
                  print(global.theme);
                  global.theme = !global.theme;
                  });
                },));
              }).toList();
            })
          ],
      ),
      
      drawer: Drawer(child: 
      ListView(
        children: [
          ListTile(
            title: TextButton(child: Text('Home'), onPressed: null,),
          ),
          ListTile(
            title: TextButton(child: Text('Product'), onPressed:()=>_product(context),),
          ),
          ListTile(
            title: TextButton(child: Text('LogOut'), onPressed: ()=>_logOut(context),),
          )
      ],)
      ,),
      body: Column(
        children: [
          Container(child: Text("Ayam Ayaman"),padding: EdgeInsets.all(20),),
          Container(child:
      CarouselSlider(items: [
        Image(image: AssetImage(_images[0]),),
        Image(image: AssetImage(_images[1]),),
        Image(image: AssetImage(_images[2]),),
        Image(image: AssetImage(_images[3]),),
      ],options: CarouselOptions(
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3))
      ),
      ),
      Container(child: Text("Tempat jual ayam yang murah murah hehe"),padding: EdgeInsets.all(20),),
      ])
     ),
    );
  }

}