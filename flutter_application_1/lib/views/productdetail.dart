import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/review.dart';
import 'package:flutter_application_1/utils/globals.dart' as global;

class ListDetailPage extends StatefulWidget{
  String img;
  String name;
  String price;
  String desc;
  
  ListDetailPage(this.img,this.name,this.price,this.desc);

  @override
  State<StatefulWidget> createState() {
    return productDetailStage(img,name,price,desc);
  }
}

class productDetailStage extends State<ListDetailPage>{
  var _ctrlComment = TextEditingController();
  var temp=[];
  String img;
  String name;
  String price;
  String desc;

 productDetailStage(this.img,this.name,this.price,this.desc);

  Widget _buildWidget(Review r){
    return Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: 50,
              minWidth: 50,
              maxHeight: 60,
              maxWidth: 60
          ),
        ),
        title: Text(r.comment + ' by '+r.username),
      ),
    );
  }

  void _onPressed(BuildContext ctx){
    if(_ctrlComment.text.isEmpty){
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text('Comment cannot be empty bos')));
    }else{
      setState(() {
      listReviews.add(new Review(name,_ctrlComment.text,global.username));
      });
      _ctrlComment.text ="";
    }
  }

  @override
  Widget build(BuildContext context) {
    temp.clear();
   for(var i =0;i<listReviews.length;i++){
      if(listReviews[i].product==name){
        temp.add(listReviews[i]);
      }
    }

    return DefaultTabController(length: 2,child:Scaffold(
      appBar: AppBar(title: Text(global.username),
          bottom: TabBar(tabs: [
            Tab(icon:Icon(Icons.shopping_cart_outlined)),
            Tab(icon:Icon(Icons.comment)),
          ]),
      ),
      body:TabBarView(children: [
        SingleChildScrollView(
          child: Column(
      children: [
        Image(image: AssetImage('assets/$img')),
        Text(name),
        Text(price),
        Text(desc),
        TextField(decoration:InputDecoration(hintText: "Review / Comments"),controller: _ctrlComment),
        ElevatedButton(onPressed: ()=>_onPressed(context),child: Text("Submit"),)
        ],
      ),
        ),
      ListView(children: temp.map((e) => _buildWidget(e)).toList(),
      )
      ]
      )
      ,
      )
      );
  }

}