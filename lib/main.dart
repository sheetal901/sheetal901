import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {

    runApp(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyApp(),));
  }


  class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Money"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                      LimitRangeTextInputFormatter(0, 500),
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Amount',
                      hintText: 'Enter Amount',
                    ),


        ),
                  ),



                RaisedButton(
                  textColor: Colors.black,
                  color: Colors.grey,
                  child: Text('Confirm to pay'),
                  onPressed: () {
                    showAlertDialog(context);
                  },
                ),
    ]
    )
    )
    );
  }
}

class LimitRangeTextInputFormatter  extends TextInputFormatter {
  LimitRangeTextInputFormatter(this.min, this.max) : assert(min < max);

  final int min;
  final int max;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var value = int.parse(newValue.text);
    if (value < min) {
      return TextEditingValue(text: min.toString());
    } else if (value > max) {
      return TextEditingValue(text: max.toString());
    }
    return newValue;
  }
}




showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Message"),
    content: Text("Money credited to your account"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
