import 'package:flutter/material.dart';
import 'package:super_qr_reader/super_qr_reader.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanQR extends StatefulWidget {
  ScanQR({Key key}) : super(key: key);

  @override
  _ScanQRState createState() => _ScanQRState();
}

String qrData = "No data found!";
var data;
bool hasdata = false;

class _ScanQRState extends State<ScanQR> {
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "QRをスキャン",
        child: Scaffold(
          appBar: AppBar(
            title: Text("QRスキャナー"),
          ),
          body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        "URLにアクセス: ${(qrData)}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.launch_outlined),
                      onPressed: hasdata
                          ? () async {
                              if (await canLaunch(qrData)) {
                                await launch(qrData);
                              } else {
                                throw "Could not Launch";
                              }
                            }
                          : null,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: ((MediaQuery.of(context).size.width) / 2) - 45,
                  height: 35,
                  child: OutlineButton(
                    focusColor: Colors.red,
                    highlightColor: Colors.blue,
                    hoverColor: Colors.lightBlue[100],
                    borderSide: BorderSide(width: 3, color: Colors.blue),
                    shape: StadiumBorder(),
                    child: Text(
                      "QRコードを読み込む",
                      style: TextStyle(fontSize: 11),
                    ),
                    onPressed: () async {
                      String results = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScanView()),
                      );
                      if (results != null) {
                        setState(() {
                          qrData = results;
                          hasdata = true;
                        });
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
