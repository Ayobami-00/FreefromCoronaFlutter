import 'package:flutter/material.dart';
import 'package:free_from_corona/provider/user_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Container(
      color: Colors.white,
      child: Center(child: FlatButton(color: Colors.black,child: Text("Text"),onPressed:(){user.signOut();},)),

      
      
    );
  }
}