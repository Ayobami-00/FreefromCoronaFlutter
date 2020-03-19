import 'package:flutter/material.dart';
import 'package:free_from_corona/provider/user_provider.dart';
import 'package:provider/provider.dart';

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Container(
      color: Colors.white,
      child: Center(child: FlatButton(onPressed:(){user.signOut();} , child: Text("5"))),
      
    );
  }
}