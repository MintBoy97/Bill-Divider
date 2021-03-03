import 'package:flutter/material.dart';

class InfoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InfoWidget();
  }
}

class _InfoWidget extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text("Developed with ❤ by Ismael Zavala López"),
        ),
      ),
    );
  }
}
