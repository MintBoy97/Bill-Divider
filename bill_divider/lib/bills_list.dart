import 'package:bill_divider/bill_item.dart';
import 'package:bill_divider/bill_resume.dart';
import 'package:flutter/material.dart';

class BillsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BillsList();
  }
}

class _BillsList extends State<BillsList> {
  List<BillItem> _billList = [];

  @override
  void initState() {
    super.initState();

    _billList.add(BillItem());
    _billList.add(BillItem());
    print("Init State BillList");
  }

  void addItemToList() {
    setState(() {
      _billList.add(BillItem());
      print("Update State BillList");
    });
  }

  void removeItemFromList() {
    setState(() {
      _billList.removeAt(_billList.length-1);
      print("Update State BillList");
    });
  }

  void openNewScreen() {
    setState(() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => BillResume(_billList)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 31),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                heroTag: "btn1",
                onPressed: addItemToList,
                child: Icon(Icons.add),
                backgroundColor: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 100),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                heroTag: "btn2",
                onPressed: removeItemFromList,
                child: Icon(Icons.remove),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              heroTag: "btn3",
              onPressed: openNewScreen,
              child: Icon(Icons.play_arrow_rounded),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 70),
          child: ListView.builder(
              itemCount: _billList.length,
              itemBuilder: (BuildContext context, int index) {
                return _billList[index];
              }),
        ),
      ),
    );
  }
}
