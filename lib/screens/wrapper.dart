import 'package:coffee_maker/models/user.dart';
import 'package:coffee_maker/screens/authenticate/authenticate.dart';
import 'package:coffee_maker/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    //return either home or authenticate widget
    if(user==null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}
