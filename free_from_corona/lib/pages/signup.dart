import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:free_from_corona/pages/homepage.dart';
import 'package:free_from_corona/provider/user_provider.dart';
import 'package:free_from_corona/widgets/loading.dart';
import 'package:gender_selection/gender_selection.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  bool hidePass = true;
  String selectedGender;
  DateTime dateOfBirth;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
        key: _key,
        body: user.status == Status.Authenticating
            ? Loading()
            : Container(
                color: Colors.deepPurple,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(40.0, 125.0, 60.0, 125.0),
                      child: Container(
                        color: Colors.white,
                        child: Form(
                            key: _formKey,
                            child: ListView(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14.0, 0.0, 14.0, 0.0),
                                  child: Material(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ListTile(
                                        title: TextFormField(
                                          controller: _name,
                                          decoration: InputDecoration(
                                            hintText: "Full name",
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "The name field cannot be empty";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14.0, 0.0, 14.0, 0.0),
                                  child: Material(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ListTile(
                                        title: TextFormField(
                                          controller: _email,
                                          decoration: InputDecoration(
                                            hintText: "Email",
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              Pattern pattern =
                                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                              RegExp regex =
                                                  new RegExp(pattern);
                                              if (!regex.hasMatch(value))
                                                return 'Please make sure your email address is valid';
                                              else
                                                return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14.0, 0.0, 14.0, 0.0),
                                  child: Material(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ListTile(
                                        title: TextFormField(
                                          controller: _phonenumber,
                                          decoration: InputDecoration(
                                            hintText: "Phone No.",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14.0, 0.0, 14.0, 0.0),
                                  child: Material(
                                    color: Colors.white,
                                    elevation: 0.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ListTile(
                                        title: TextFormField(
                                          controller: _password,
                                          decoration: InputDecoration(
                                            hintText: "Password",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      right: 20.0,
                      top: 200.0,
                      bottom: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.all(70.0),
                        child: GenderSelection(
                          maleText: "Male", //default Male
                          femaleText: "Female", //default Female
                          selectedGenderIconBackgroundColor:
                              Colors.indigo, // default red
                          checkIconAlignment:
                              Alignment.centerRight, // default bottomRight
                          selectedGenderCheckIcon: null, // default Icons.check
                          onChanged: (Gender gender) {
                            if (gender.toString() == 'Gender.Male') {
                              selectedGender = 'male';
                              print(selectedGender);
                            } else {
                              selectedGender = 'female';
                              print(selectedGender);
                            }
                          },
                          equallyAligned: true,
                          animationDuration: Duration(milliseconds: 400),
                          isCircular: true, // default : true,
                          isSelectedGenderIconCircular: true,
                          opacityOfGradient: 0.6,
                          padding: const EdgeInsets.all(3),
                          size: 120, //default : 120
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      right: 20.0,
                      top: 500.0,
                      bottom: 100.0,
                      child: Padding(
                        padding: const EdgeInsets.all(70.0),
                        child: FlatButton(
                            color: Colors.white,
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2018, 3, 5),
                                  maxTime: DateTime(2019, 6, 7),
                                  onChanged: (date) {
                                dateOfBirth = date;
                                print('change $date');
                              }, onConfirm: (date) {
                                dateOfBirth = date;
                                print('confirm $date');
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en);
                            },
                            child: Text(
                              'Date of Birth',
                              style: TextStyle(color: Colors.deepPurple),
                            )),
                      ),
                    ),
                    Positioned(
                      left: 300.0,
                      right: 10.0,
                      top: 300.0,
                      bottom: 300.0,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Text('LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ),
                        color: Colors.green.withOpacity(0.7),
                      ),
                    ),
                    Positioned(
                      left: 40.0,
                      right: 60.0,
                      top: 635.0,
                      bottom: 80.0,
                      child: FlatButton(
                        onPressed: () async{
                          if (_formKey.currentState.validate()){
                            if (!await user.signUp(
                                _name.text, _email.text, _password.text,_phonenumber.text,selectedGender,dateOfBirth.toString())) {
                              _key.currentState.showSnackBar(
                                  SnackBar(content: Text("Sign up failed")));
                              return;
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                        },
                        child: Text('SIGN UP',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        color: Colors.green.withOpacity(0.7),
                      ),
                    )
                  ],
                )));
  }
}
