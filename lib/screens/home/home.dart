import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_maker/models/brew.dart';
import 'package:coffee_maker/screens/home/settings_form.dart';
import 'package:coffee_maker/services/auth.dart';
import 'package:coffee_maker/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'brew_list.dart';

class Home extends StatelessWidget {
  final  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

    return StreamProvider <List<Brew>>.value(
      value: DatabaseService().brews,
      child:Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('The Beans'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(onPressed: () async {
            await _auth.signOut();
          },
              icon: Icon(Icons.person),
              label:Text('Log Out')),
          FlatButton.icon(onPressed: () => _showSettingsPanel(),
              icon: Icon(Icons.settings),
              label: Text('Settings'))
        ],
      ),
          body:Container(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: NetworkImage('https://s3.envato.com/files/256760345/coffpl_nov-7.jpg'),
    fit: BoxFit.cover,
    )
    ),
         child: BrewList(),
    ),
      ),
    );
  }
}
