import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async' show Future;
import 'package:fluttertoast/fluttertoast.dart';

// Local Imports
import 'package:EmojiCode/encryptdecrypt.dart';

void main() => runApp(EmojiCodeApp());

class EmojiCodeApp extends StatelessWidget {
  static const String _title = 'EmojiCode';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500.0,
        child: Padding(
          padding: EdgeInsets.fromLTRB(5.0, 300.0, 5.0, 5.0),
          child: TextField(
            key: Key("textBox"),
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter text here.',
            ),
          ),
        ));
  }
}

class OutputBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextUpdater();
  }
}

class TextUpdater extends StatefulWidget {
  UpdateTextState createState() => UpdateTextState();
}

class UpdateTextState extends State {
  String textHolder = "Click Encrypt/Decrypt to get encrypted/decrypted text.";
  String inputtedText = "";

  changeText(String message) {
    setState(() {
      textHolder = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
            width: 500.0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(5.0, 300.0, 5.0, 5.0),
              child: TextField(
                onChanged: (newText) {
                  inputtedText = newText;
                },
                style: TextStyle(
                  fontSize: 22.0,
                  wordSpacing: 2.0,
                ),
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter text here.',
                ),
              ),
            )),
        ButtonBar(
          mainAxisSize: MainAxisSize.max,
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: const Text("Encrypt"),
              onPressed: () {
                changeText(encryptText(inputtedText));
              },
            ),
            RaisedButton(
              child: const Text("Decrypt"),
              onPressed: () {
                var returnText = decryptText(inputtedText);
                if (returnText == "") {
                  changeText("Warning, message has been tampered with.");
                } else {
                  changeText(returnText);
                }
              },
            ),
            RaisedButton(
                child: const Text("Copy to Clipboard"),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: textHolder))
                      .then((result) {
                    Fluttertoast.showToast(msg: "copied");
                  });
                })
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(300.0, 10.0, 300.0, 10.0),
          child: SelectableText(
            "$textHolder",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
              wordSpacing: 2.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EmojiCode"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(IconData(59530, fontFamily: 'MaterialIcons')),
            tooltip: "EmojiCode Repository.",
            onPressed: () {
              MainScreen._launchURL();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: TextUpdater(),
      ),
    );
  }

  static void _launchURL() async {
    const url = 'https://github.com/Ashrit-Yarava/EmojiCode';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
