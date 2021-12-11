import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gfs/on_board_screen.dart';

import 'Utilities/colors.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: CupertinoButton(
        //elevation: 5.0,
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        color: Colores.gfsBlue,
        onPressed:
            () /*async {
          FirebaseMessaging messaging = FirebaseMessaging.instance;

// use the returned token to send messages to users from your custom server
          String? token = await messaging.getToken(
            vapidKey: "BGpdLRs......",
          );
          print("Token: $token");*/
            {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => OnBoardScreen()));
          //asignamos el valor que devuelve la funcion a una variable para meterla en el if
        },
        padding: EdgeInsets.all(15.0),
        /*shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),*/
        child: Text(
          'Register',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
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
