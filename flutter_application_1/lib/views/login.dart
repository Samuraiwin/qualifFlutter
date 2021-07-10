import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/globals.dart' as global;

import 'home.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
      }
    
    }
    
    class LoginState extends State<LoginPage> {

      var _ctrlEmail = TextEditingController();
      var _ctrlPass = TextEditingController();

      var _passWrong = false;
      var _emailWrong = false;
      var _emailErr= "";
      var _passErr = "";

      void _onPressed(BuildContext context){
        if(_ctrlEmail.text ==""){
          setState(() {
          _emailWrong = true;
          _emailErr="Email cant be empty!";
          });
        }else if(_ctrlEmail.text.toString().contains("@.") || !_ctrlEmail.text.toString().endsWith(".com")){
          setState(() {
          _emailWrong = true;
          _emailErr="Email Invalid!";
          });
        }else{
          _emailWrong=false;
          _emailErr="";
        }
        if(_ctrlPass.text ==""){
          setState(() {
            _passWrong=true;
            _passErr ="Password cant empty!";
          });
        }else if(_ctrlPass.text.toString().length < 6){
          setState(() {
            _passWrong=true;
            _passErr ="Password Lenght must be more than 6!";
          });
        }else{
          _passErr="";
          _passWrong=false;
        }


        if(!_emailWrong && !_passWrong){
          global.username = _ctrlEmail.text.substring(0,_ctrlEmail.text.toString().indexOf('@'));
          Navigator.push(context, MaterialPageRoute(builder: (context){
              return MaterialApp(
                home:Scaffold(
                body:HomePage(),
              ));
          }));
        }
      }

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          Container(
            height: 100,
            width: 100,
            child: Image.asset('assets/logo.png'),
          )
          ,
          Container(
            padding: EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Email",
              errorText: _emailWrong ? _emailErr : null,
              ),
            controller: _ctrlEmail,
          )
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              errorText: _passWrong ?  _passErr : null,
              ),
            controller: _ctrlPass,
          ),
          
          ),
          
          ElevatedButton(onPressed: () => _onPressed(context),child: Text("Login"),)
        ]
        ,);
  }


}