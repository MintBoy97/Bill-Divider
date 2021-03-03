import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillItem extends StatelessWidget {
  String name = "Name";
  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
        padding: EdgeInsets.all(5),
        child: Center(
          child: Row(
            children: [
              Icon(
                Icons.account_circle,
                size: 40,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Name"),
                    onChanged: (text) {
                      this.name = text;
                    },
                  ),
                )
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Value"),
                    onChanged: (text) {
                      this.value = double.parse(text);
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
