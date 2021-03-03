import 'package:bill_divider/bill_item.dart';
import 'package:flutter/material.dart';

class BillResume extends StatelessWidget {

  String _msj = "";

  BillResume(List<BillItem> billList){
    makeDivision(billList);
  }

  roundDouble2Dec(double n) {
    return double.parse((n).toStringAsFixed(2));
  }

  void makeDivision(List<BillItem> billList) {
    double total = 0.0;
    int members = billList.length;
    _msj += "--Expenses per person--\n";

    for(var i = 0; i < members; i++) {
      _msj += "${billList[i].name} spent ${roundDouble2Dec(billList[i].value)}\n";
      total += roundDouble2Dec(billList[i].value);
    }
    double cPer = roundDouble2Dec(total/members);
    _msj += "\nTotal: $total\nSubtotal per person: $cPer\n";

    _msj += "\n--Accounts per person--\n";
    double subT = 0.0;
    List nAccount = [];
    for(var i = 0; i < members; i++) {
      subT = roundDouble2Dec(billList[i].value - cPer);
      if(subT >= 0) {
        _msj += "${billList[i].name} is owed $subT\n";
      } else {
        _msj += "${billList[i].name} must pay ${subT*-1}\n";
      }
      nAccount.add([billList[i].name,subT]);
    }

    print(nAccount);
    nAccount.sort((a,b) {
      if (a[1] < b[1]) {
        return 1;
      } else if (a[1] == b[1]) {
        return 0;
      }
      return -1;
    });
    print(nAccount);

    _msj += "\n--Pay List--\n";
    double op = 0.0;
    for(var i = 0; i < members; i++) {
      for(var j = i+1; j < members; j++) {
        if(nAccount[j][1] < 0) {
          op = roundDouble2Dec(nAccount[i][1] + nAccount[j][1]);
          if(op>=0){
            _msj += "${nAccount[j][0]} must pay ${nAccount[j][1]*-1} to ${nAccount[i][0]}\n";
            nAccount[i][1] = op;
            nAccount[j][1] = 0;
          } else {
            _msj += "${nAccount[j][0]} must pay ${nAccount[i][1]} to ${nAccount[i][0]}\n";
            nAccount[i][1] = 0;
            nAccount[j][1] = op;
          }
        }
      }
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bill resume"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Text(_msj),
      )
    );
  }
}
