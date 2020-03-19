import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  // String CURRENT_USER_NAME = 'Guest';
  final List<Widget> _children = [
    // Credits(),
    // HomePage(),
    // Debits(),
  ];

  // @override
  // void initState() {
  //   // getStringValuesSF();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: <Widget>[
          Expanded(child: Text('Accountz -',textAlign: TextAlign.center,)),
          // Expanded(child: Text(CURRENT_USER_NAME))
        ],
          ),
      ),
      body: _children[_currentIndex],
      //  _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, 
        onTap: onTabTapped,
       items: [
         
         BottomNavigationBarItem(
           icon: new Icon(Icons.attach_money),
           title: new Text('Credits'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           title: new Text('Home'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.attach_money),
           title: Text('Debits')
         )
       ],
     ),
     
    );
  }
//     getStringValuesSF() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //Return String
//   String stringValue = prefs.getString('CURRENT_USER_NAME');
//   setState(() {
//     CURRENT_USER_NAME = stringValue; 
//   });
// }

  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
}