import 'package:scanner/main.dart';
import 'package:scanner/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BarcodeScanPage extends StatefulWidget {
  @override
  _BarcodeScanPageState createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  String barcode = 'G-Block';
    @override
  Widget build(BuildContext context) =>
      Scaffold(resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(MyApp.title),
          ),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height:1),
                    CircleAvatar(

                      backgroundImage: AssetImage('images/capture.png'),


                      radius: 40,
                    ),
                    SizedBox(height: 1),
                    Text(
                      'Scan Result',
                      style: TextStyle(
                        fontSize: 30,
                       color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),



                    Text(
                      '$barcode',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),


                    SizedBox(height: 10),
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter Amount",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ),

                      validator: (val) {
                        if (val.length == 0) {
                          return "Amount cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(height: 30),
                    RaisedButton(

                      textColor: Colors.white,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('Confirm to pay',
                        style: TextStyle(fontSize: 22.0),
                      ),
                      onPressed: () {
                        showAlertDialog(context);
                      },
                    ),


                  ]
              )
          )
      );
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
      title: Text("Message",style: TextStyle(color: Colors.white),),

      content: Text("Transaction Succesful",style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.black,

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



