import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:free_from_corona/utils/hex_colour.dart';

class WashPage extends StatefulWidget {
  @override
  _WashPageState createState() => _WashPageState();
}

class _WashPageState extends State<WashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#d1e9ea"),
      body: Column(children: <Widget>[
        SizedBox(height: 80.0),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SvgPicture.asset(
                    'images/virus.svg',
                    width: 50.0,
                  ),
                  Column(
                    children: <Widget>[
                      SvgPicture.asset(
                        'images/Icon awesome-lightbulb.svg',
                        width: 30.0,
                      ),
                      SizedBox(height: 10.0),
                      Text('More Tips'),
                    ],
                  ),
                ]),
          ),
        ),
        SizedBox(height: 50.0),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SvgPicture.asset(
                    'images/faucet.svg',
                    width: 100.0,
                  ),
                  SvgPicture.asset(
                    'images/hand-sanitizer.svg',
                    width: 100.0,
                  ),
                ]),
          ),
        ),
        SizedBox(height: 40.0),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Container(
            child: SvgPicture.asset(
              'images/soap.svg',
              width: 150.0,
              height: 150.0,
            ),
          ),
        ),
        SizedBox(height: 40.0),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 210.0),
          child: Container(
            child: Text("Today's Record"),
          ),
        ),
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Container(
            decoration: BoxDecoration(
              color: HexColor("#415f77"),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[350],
                  blurRadius: 20.0, // has the effect of softening the shadow
                )
              ],
            ),
            child: ListTile(
                leading: Icon(
                  Icons.timer,
                  color: Colors.white,
                  size: 40.0,
                ),
                enabled: true,
                title: Text("12:00pm", style: TextStyle(color: Colors.white)),
                subtitle:
                    Text("Next Time", style: TextStyle(color: Colors.white)),
                trailing: Text('Clean Your Hands',
                    style: TextStyle(color: Colors.white))),
          ),
        ),
      ]),
    );
  }
}
