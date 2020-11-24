import 'package:flutter/material.dart';
import 'package:tahara_qrcode_reader/QR%20Generator/GeneratedQR.dart';

class QRGenerator extends StatefulWidget {
  @override
  _QRGeneratorState createState() => _QRGeneratorState();
}

TextEditingController mycontroller = new TextEditingController();

class _QRGeneratorState extends State<QRGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QRを作成"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: mycontroller,
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                  labelText: "QRコードを作成してみよう！",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
                  prefixIcon: Icon(Icons.link),
                ),
                onEditingComplete: navigate,
              ),
            ),
            Container(
              width: ((MediaQuery
                  .of(context)
                  .size
                  .width) / 2) - 45,
              height: 35,
              child: OutlineButton(
                focusColor: Colors.red,
                highlightColor: Colors.blue,
                hoverColor: Colors.lightBlue[100],
                borderSide: BorderSide(width: 3, color: Colors.blue),
                shape: StadiumBorder(),
                child: Text(
                  "QRを作成",
                  style: TextStyle(fontSize: 17),
                ),
                onPressed: navigate,
              ),
            ),
          ],
        ),
      ),
    );
  }

    void navigate() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GeneratedQR(mycontroller.text)));
    }
  }
