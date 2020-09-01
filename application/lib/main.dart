import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';


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
