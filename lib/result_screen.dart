import 'package:flutter/material.dart';
import 'dart:ui' as prefix0;


class ResultScreen extends StatelessWidget {
  final imtModel;
  ResultScreen({this.imtModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/imtBg.jpg"),fit:BoxFit.cover)
              ),
            ),
            BackdropFilter(
              filter: prefix0.ImageFilter.blur(sigmaX: 4,sigmaY: 4),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6)
                ),
              ),
            ),
            ListView(
              padding: EdgeInsets.only(top: 90),
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height/2.5,
                      width: MediaQuery.of(context).size.width/2,
                      child: imtModel.isNormal
                          ? Image.asset(
                        "assets/images/strong.png",
                        fit: BoxFit.contain,
                      )
                          : Image.asset(
                        "assets/images/sad.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "IMT anda ${imtModel.imt.round()}",
                      style: TextStyle(
                          color: Colors.red[700],
                          fontSize: 34,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "${imtModel.comments}",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    imtModel.isNormal
                        ? Text(
                      "Horee! IMT anda Normal.",
                      style: TextStyle(
                          color: Colors.red[700],
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )
                        : Text(
                      "Sedih! IMT anda tidak Normal.",
                      style: TextStyle(
                          color: Colors.red[700],
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      child: FlatButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        label: Text("AYO HITUNG LAGI"),
                        textColor: Colors.white,
                        color: Colors.pink,
                      ),
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 16, right: 16),
                    )
                  ],
                ),
              ],
            ),
          ],
        )
    );
  }
}
