import 'package:flutter/material.dart';
import 'package:tahara_qrcode_reader/QR%20Generator/QRGenerator.dart';
import 'package:tahara_qrcode_reader/ScanQR.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("QRスキャン / QR作成"),
      ),
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: (MediaQuery
                    .of(context)
                    .size
                    .height) -
                    AppBar().preferredSize.height -
                    kToolbarHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                      "assets/images/aiueo.jpg"
                  ),
                  foregroundColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  radius: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(tag: "スキャン QR",
                      child: Container(
                        width: ((MediaQuery
                            .of(context)
                            .size
                            .width) / 2) - 45,
                        height: 50,
                        child: OutlineButton(
                          focusColor: Colors.red,
                          highlightColor: Colors.blue,
                          hoverColor: Colors.lightBlue[100],
                          borderSide: BorderSide(width: 3, color: Colors.blue),
                          shape: StadiumBorder(),
                          child: Text("QRをスキャン", style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => ScanQR()));
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 25,),
                    Container(
                      width: ((MediaQuery
                          .of(context)
                          .size
                          .width) / 2) - 45,
                      height: 50,
                      child: OutlineButton(
                        focusColor: Colors.red,
                        highlightColor: Colors.blue,
                        hoverColor: Colors.lightBlue[100],
                        borderSide: BorderSide(width: 3, color: Colors.blue),
                        shape: StadiumBorder(),
                        child: Text("QRを作成", style: TextStyle(fontSize: 17),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => QRGenerator()));
                        },
                      ),
                    ),

                  ],
                )

              ],),

          ),
        ),
      ),
    );
  }
}