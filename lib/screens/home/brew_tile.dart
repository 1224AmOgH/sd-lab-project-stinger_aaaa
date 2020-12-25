import 'package:coffee_maker/models/brew.dart';
import 'package:flutter/material.dart';

    class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({this.brew});
      @override
      Widget build(BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.brown[brew.strength],
                backgroundImage: NetworkImage('https://i.pinimg.com/originals/aa/95/01/aa9501df489c885cce3f31b0fc6234ef.png'),
              ),
              title: Text(brew.name),
              subtitle: Text('Takes ${brew.sugars} sugar(s)'),
            ),
          ),
        );
      }
    }
