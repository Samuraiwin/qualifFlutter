import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/icon.dart';
import 'package:flutter_application_1/views/productdetail.dart';
import 'package:flutter_application_1/utils/globals.dart' as global;

import 'home.dart';
import 'login.dart';

class ListPage extends StatelessWidget{
  var _ctx=null;
  var _data=[
    IconClass('1.jpg', 'Ayam 1','20000','ini ayam 1'),
    IconClass('2.jpg', 'Ayam 2','30000','ini ayam 2'),
    IconClass('3.jpg', 'Ayam 3','40000','ini ayam 3'),
    IconClass('4.jpg', 'Ayam 4','50000','ini ayam 4'),
  ];


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

void _home(BuildContext ctx){
  Navigator.push(ctx,MaterialPageRoute(builder: (ctx){
      return MaterialApp(
        home: Scaffold(body: HomePage(),),
        
      );
    }));
}

  void _onPressed(IconClass i){
    Navigator.push(_ctx, MaterialPageRoute(builder: (builder) {
      return ListDetailPage(i.img,i.name,i.price,i.desc);
    }));
  }

  Widget _buildWidget(IconClass i){
      return Card(
        child:ListTile(
          leading : ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 50,
              minWidth: 50,
              maxHeight: 60,
              maxWidth: 60
             ),
            child: Image.asset(
              'assets/${i.img}',
              fit:BoxFit.cover,
            ),
            ),
          title: Text(i.name),
          subtitle: Text(i.price),
          trailing: ElevatedButton(child: Text("Details"),
          onPressed: ()=>_onPressed(i),
          ),
        ),
      );
  }
  

  @override
  Widget build(BuildContext context) {
    this._ctx = context;
    return Scaffold(
      appBar: AppBar(title: Text(global.username),),
      drawer: Drawer(child: 
      ListView(
        children: [
          ListTile(
            title: TextButton(child: Text('Home'), onPressed: ()=>_home(context),),
          ),
          ListTile(
            title: TextButton(child: Text('Product'), onPressed:()=>_product(context),),
          ),
          ListTile(
            title: TextButton(child: Text('LogOut'), onPressed: ()=>_logOut(context),),
          )
      ],)
      ,),
      body: ListView(
      children: _data.map((e)=>_buildWidget(e)).toList()));
        }
}