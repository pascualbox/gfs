import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Utilities/colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String usuario = "";
  String pass = "";
  bool checkboxstate = false;
  String textoerror = "";
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
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: _buildRememberMeSwitch(),
                          ),
                          Column(children: [
                            _buildForgotPasswordBtn(),
                            _buildRegisterBtn(),
                          ]),
                        ],
                      ),
                      _buildLoginBtn(),
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

  cargarDatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //checkboxstate == prefs.getBool('estado');
    usuario = prefs.getString('user')!;
    pass = prefs.getString('password')!;
    if (usuario == null && pass == null) {
      _usercontroller.text = '';
      _passwordcontroller.text = '';
      //checkboxstate == false;
    } else if (usuario != null && pass != null) {
      _usercontroller.text = usuario.toString();
      _passwordcontroller.text = pass.toString();
      //checkboxstate == true;
    }
    setState(() {});
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

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: CupertinoButton(
        padding: EdgeInsets.only(right: 0.0),
        child: Text('Forgot password',
            style: TextStyle(
              color: Colores.textColor,
              fontFamily: 'OpenSans',
            )),
        onPressed: () {},
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
        onPressed: () {},
      ),
    );
  }

  Widget _buildRememberMeSwitch() {
    return Container(
      height: 20.0,
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: CupertinoSwitch(
              value: checkboxstate,
              trackColor: Colores.gfsGrey,
              activeColor: Colores.gfsBlue,
              onChanged: (value) {
                setState(() {
                  checkboxstate = value;
                });
              },
            ),
          ),
          Text('Remember me',
              style: TextStyle(
                color: Colores.textColor,
                fontFamily: 'OpenSans',
              )),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: CupertinoButton(
        //elevation: 5.0,
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        color: Colores.gfsBlue,
        onPressed: () async {
          FirebaseMessaging messaging = FirebaseMessaging.instance;

// use the returned token to send messages to users from your custom server
          String? token = await messaging.getToken(
            vapidKey: "BGpdLRs......",
          );
          print("Token: $token");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => LoginScreen()));
          //asignamos el valor que devuelve la funcion a una variable para meterla en el if
        },
        padding: EdgeInsets.all(15.0),
        /*shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),*/
        child: Text(
          'Log in',
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
}

class ImagenLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage foto = new AssetImage('assets/gfs.png');
    Image imagen = Image(
      image: foto,
      fit: BoxFit.contain,
    );
    return Container(
        child: imagen,
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width);
  }
}
