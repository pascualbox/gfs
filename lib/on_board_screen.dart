import 'dart:async';

import 'package:easy_onboarding/easy_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gfs/login_screen.dart';
import 'package:images_picker/images_picker.dart';
import 'package:scan/scan.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Utilities/colors.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  ScanController controller = ScanController();
  String qrcode = 'Unknown';
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  Future<void> _saveToken(String qrcode) async {
    final SharedPreferences sp = await preferences;

    setState(() {
      sp.setString('token', qrcode);
      sp.setString('centro', qrcode);
    });
  }

  @override
  Widget build(BuildContext context) {
    AssetImage bgImage = new AssetImage('assets/logos/login_bg.jpg');
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: bgImage,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colores.bgBlueColor, BlendMode.modulate)),
            ),
          ),
          EasyOnboarding(
            onStart: () {
              _confirmScanImage();
            },
            skipButtonColor: Colors.transparent,
            backButtonColor: Colores.gfsBlue,
            nextButtonColor: Colores.gfsBlue,
            backgroundColor: Colores.gfsBlack,
            indicatorSelectedColor: Colores.bgBlueColor,
            indicatorUnselectedColor: Colores.fgBlueColor,
            startButtonColor: Colores.gfsBlue,
            bottomBackgroundColor: Colores.gfsBlack,
            nextButtonIcon: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            skipButtonText: Text(
              'SKIP',
              style: TextStyle(fontSize: 15.0, color: Colores.gfsGrey),
            ),
            startButtonText: Text(
              'Escanear desde imagen',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
            backButtonIcon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            children: [
              Container(
                  color: Colores.gfsBlack,
                  child: Column(
                    children: [
                      Image(
                        image: new AssetImage('assets/bg.png'),
                      ),
                      Image(
                        image: new AssetImage('assets/gfs.png'),
                      ),
                    ],
                  )),
              Container(
                  color: Colores.gfsBlack,
                  child: Column(
                    children: [
                      Image(
                        image: new AssetImage('assets/bg.png'),
                      ),
                      Image(
                        image: new AssetImage('assets/gfs.png'),
                      ),
                    ],
                  )),
              Container(
                  color: Colores.gfsBlack,
                  child: Column(
                    children: [
                      Image(
                        image: new AssetImage('assets/bg.png'),
                      ),
                      Image(
                        image: new AssetImage('assets/gfs.png'),
                      ),
                    ],
                  )),
              Container(
                  color: Colores.gfsBlack,
                  child: Column(
                    children: [
                      Image(
                        image: new AssetImage('assets/bg.png'),
                      ),
                      Image(
                        image: new AssetImage('assets/gfs.png'),
                      ),
                    ],
                  )),
              Container(
                  color: Colores.gfsBlack,
                  child: Column(
                    children: [
                      Image(
                        image: new AssetImage('assets/bg.png'),
                      ),
                      Image(
                        image: new AssetImage('assets/gfs.png'),
                      ),
                    ],
                  )),
              Container(
                child: Column(
                  children: [
                    Image(
                      image: new AssetImage('assets/bg.png'),
                    ),
                    _buildQRScan(),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _confirmScanImage() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Select the image where you have the QR codes"),
              actions: <Widget>[
                TextButton(
                    child: Text("Accept"),
                    onPressed: () async {
                      List<Media>? res = await ImagesPicker.pick();
                      if (res != null) {
                        String? str = await Scan.parse(res[0].path);
                        if (str != null) {
                          setState(() async {
                            qrcode = str;
                            print(qrcode);
                            _saveToken(qrcode);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginScreen()));
                          });
                        }
                      }
                    }),
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ]);
        });
  }

  Widget _buildQRScan() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.3,
      child: ScanView(
        controller: controller,
        scanAreaScale: 1.0,
        scanLineColor: Colores.gfsBlue,
        onCapture: (data) {
          setState(() {
            qrcode = data;
            print(qrcode);
            _saveToken(qrcode);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginScreen()));
            ;
          });
        },
      ),
    );
  }
}
