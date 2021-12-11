import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Utilities/colors.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{
  String usuario = "";
  String pass = "";
  String textError = "";
  final _usercontroller = new TextEditingController();
  final _passwordcontroller = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    AssetImage bgImage = new AssetImage('assets/bg.png');

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: bgImage,
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colores.bgBlueColor, BlendMode.modulate))),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ImagenLogo(),
                      _buildUserTF(),
                      _buildPasswordTF(),
                      _buildPasswordTwiceTF(),
                      _buildRegisterBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildRegisterBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: CupertinoButton(
        padding: EdgeInsets.only(right: 0.0),
        child: Text('Register',
            style: TextStyle(
              color: Colores.textColor,
              fontFamily: 'OpenSans',
            )),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => LoginScreen()));
        },
      ),
    );
  }

  Widget _buildUserTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'User',
          style: TextStyle(
            color: Colores.labelColor,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(height: 10.0),
        //GfsTextField(textSize: 13, color: Colores.textColor, isSecret: false),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            controller: _usercontroller,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colores.textColor,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_circle_rounded,
                color: Colores.iconColor,
              ),
              hintText: 'Insert your username',
              hintStyle: TextStyle(
                color: Colores.hintColor,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
            color: Colores.labelColor,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colores.textColor,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colores.iconColor,
              ),
              hintText: 'Insert your password',
              hintStyle: TextStyle(
                color: Colores.hintColor,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildPasswordTwiceTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Repeat your password',
          style: TextStyle(
            color: Colores.labelColor,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colores.textColor,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colores.iconColor,
              ),
              hintText: 'Repeat your password',
              hintStyle: TextStyle(
                color: Colores.hintColor,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ],
    );
  }

  }

