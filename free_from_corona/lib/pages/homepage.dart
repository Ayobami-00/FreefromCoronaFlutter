import 'package:flutter/material.dart';
import 'package:free_from_corona/pages/np.dart';
import 'package:free_from_corona/pages/wash.dart';
import 'package:free_from_corona/provider/user_provider.dart';
import 'package:free_from_corona/utils/hex_colour.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    Text('1'),
    Page(),
    WashPage(),
    Text('3'),
    Text('3'),
  ];

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: HexColor("#d1e9ea"),
      body: _children[_currentIndex],
      //  _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex, 
        onTap: onTabTapped,
       items: [
         
        BottomNavigationBarItem(
           icon: new Icon(Icons.new_releases,color: Colors.black,),
           title: new Text('News',style: TextStyle(color: Colors.black),),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.new_releases,color: Colors.black,),
           title: new Text('Statistics',style: TextStyle(color: Colors.black),),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.new_releases,color: Colors.black,),
           title: new Text('Wash',style: TextStyle(color: Colors.black),),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.new_releases,color: Colors.black,),
           title: new Text('Group',style: TextStyle(color: Colors.black),),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.new_releases,color: Colors.black,),
           title: new Text('History',style: TextStyle(color: Colors.black),),
         ),
       ],
     ),
     
    );
  }
    
  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
}




