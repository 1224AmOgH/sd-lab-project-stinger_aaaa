import 'package:coffee_maker/services/auth.dart';
import 'package:coffee_maker/shared/constants.dart';
import 'package:coffee_maker/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState> ();
  bool loading  = false;

  //text field state
  String  email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign Up to The Beans'),
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
            widget.toggleView();
          },
              icon: Icon(Icons.person),
              label: Text('Sign In'))
        ],
      ),

      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://cdn.imgbin.com/12/1/25/imgbin-brown-coffee-beans-background-qeuZyuE5hUCntTPRfYGEhQnM8.jpg'),
              fit: BoxFit.cover,
            )
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 180.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText:'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email': null,
                  onChanged: (val){
                    setState(() => email = val);
                  }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText:'Password'),
                validator: (val) => val.length<6 ? 'Enter a password 6+ chars long': null,
                obscureText: true,
                onChanged: (val){
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.brown,
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    setState(() => loading= true );
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        error = 'Please enter a valid Email address';
                        loading=false;
                      });
                      }
                    }
                  }
                  ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(color:Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );

  }
}
