import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncharDemo1 extends StatelessWidget {
  const UrlLauncharDemo1({super.key});

  void _openGithub() {
    launchUrl(Uri.parse("https://www.github.com"));
  }

  void _callSukanto() {
    launchUrl(Uri.parse("tel:+8801937736465"));
  }

  void _smsSukanto() {
    launchUrl(Uri.parse("sms:+8801937736465"));
  }

  void _emailSukanto() {
    launchUrl(Uri.parse("mailto:sukanto113@gmail.com"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Url Luncher demo")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: _openGithub,
                child: Text("Open Github"),
              ),
              OutlinedButton(
                onPressed: _callSukanto,
                child: Text("Call Sukanto"),
              ),
              OutlinedButton(
                onPressed: _smsSukanto,
                child: Text("SMS Sukanto"),
              ),
              OutlinedButton(
                onPressed: _emailSukanto,
                child: Text("Email Sukanto"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
