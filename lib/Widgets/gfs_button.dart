import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GfsButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color? textColor;
  final Color? iconColor;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final int? textSize;
  final Alignment? alignment;
  final String? backScreen;
  final Widget page;
  final bool fwdButton;
  const GfsButton(
      {Key? key,
      required this.text,
      required this.color,
      this.textColor,
      this.iconColor,
      this.width,
      this.height,
      this.borderRadius,
      this.padding,
      this.textSize,
      this.alignment,
      this.backScreen,
      required this.page,
      required this.fwdButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gfsButtonBorderRadius = borderRadius ?? BorderRadius.circular(10.0);
    var gfsButtonPadding = padding ?? const EdgeInsets.fromLTRB(10, 0, 0, 0);
    var gfsButtonWidth = width ?? MediaQuery.of(context).size.width * 0.9;
    var gfsButtonHeight = height ?? MediaQuery.of(context).size.height * 0.05;
    double buttonTextSize = (textSize ?? 15.0) as double;
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
          borderRadius: gfsButtonBorderRadius,
          child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) => page));
              },
              child: Container(
                  color: color,
                  padding: gfsButtonPadding,
                  width: gfsButtonWidth,
                  height: gfsButtonHeight,
                  alignment: alignment ?? Alignment.center,
                  child: Container(
                      width: gfsButtonWidth,
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Row(children: <Widget>[
                        const SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          text,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: buttonTextSize, color: textColor),
                        ),
                        const Expanded(
                          child: SizedBox(
                            width: 20.0,
                          ),
                        ),
                        fwdButton == true
                            ? Icon(CupertinoIcons.forward, color: iconColor)
                            : const SizedBox(),
                        const SizedBox(width: 5.0),
                      ]))))),
    );
  }
}
