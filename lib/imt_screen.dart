import 'package:flutter/material.dart';
import 'package:flutter_imt_indeks_massa_tubuh/imt_model.dart';
import 'package:flutter_imt_indeks_massa_tubuh/result_screen.dart';
import 'dart:ui' as prefix0;

class IMTscreen extends StatefulWidget {
  @override
  _IMTscreenState createState() => _IMTscreenState();
}

class _IMTscreenState extends State<IMTscreen> {
  double _heightOfUser = 100.0;

  double _weightOfUser = 40.0;

  double _imt = 0;

  IMTModel _imtModel;

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
                    image: AssetImage("assets/images/imt.jpg"),fit:BoxFit.cover)
            ),
          ),
          BackdropFilter(
            filter: prefix0.ImageFilter.blur(sigmaX: 4,sigmaY: 4),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6)
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Indeks Massa Tubuh",
                      style: TextStyle(
                          color: Colors.red[700],
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/3.5,
                      width: MediaQuery.of(context).size.width/3,
                      child: Image.asset(
                        "assets/images/hearth.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "IMT Kalkulator",
                      style: TextStyle(
                          color: Colors.red[700],
                          fontSize: 34,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Ayo cek kesehatan anda",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Tinggi (cm)",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 24,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Slider(
                        min: 80.0,
                        max: 250.0,
                        onChanged: (height) {
                          setState(() {
                            _heightOfUser = height;
                          });
                        },
                        value: _heightOfUser,
                        divisions: 100,
                        activeColor: Colors.pink,
                        label: "$_heightOfUser",
                      ),
                    ),
                    Text(
                      "$_heightOfUser cm",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Berat (kg)",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 24,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Slider(
                        min: 30.0,
                        max: 120.0,
                        onChanged: (height) {
                          setState(() {
                            _weightOfUser = height;
                          });
                        },
                        value: _weightOfUser,
                        divisions: 100,
                        activeColor: Colors.pink,
                        label: "$_weightOfUser",
                      ),
                    ),
                    Text(
                      "$_weightOfUser kg",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                    Container(
                      child: FlatButton.icon(
                        onPressed: () {
                          setState(() {
                            _imt = _weightOfUser /
                                ((_heightOfUser / 100) * (_heightOfUser / 100));

                            if (_imt >= 18.5 && _imt <= 25) {
                              _imtModel = IMTModel(
                                  imt: _imt,
                                  isNormal: true,
                                  comments: "Kamu Ideal");
                            } else if (_imt < 18.5) {
                              _imtModel = IMTModel(
                                  imt: _imt,
                                  isNormal: false,
                                  comments: "Kamu Kurang Berat Badan");
                            } else if (_imt > 25 && _imt <= 30) {
                              _imtModel = IMTModel(
                                  imt: _imt,
                                  isNormal: false,
                                  comments: "Kamu Kelabihan Berat Badan");
                            } else {
                              _imtModel = IMTModel(
                                  imt: _imt,
                                  isNormal: false,
                                  comments: "Kamu Obesitas");
                            }
                          });

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultScreen(
                                    imtModel: _imtModel,
                                  )));
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        label: Text("CALCULATE"),
                        textColor: Colors.white,
                        color: Colors.pink,
                      ),
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 16, right: 16),
                    ),
                    SizedBox(
                      height: 16,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
