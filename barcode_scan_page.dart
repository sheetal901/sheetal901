import 'package:scanner/main.dart';
import 'package:scanner/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'dialog.dart';
class BarcodeScanPage extends StatefulWidget {
  @override
  _BarcodeScanPageState createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  String barcode = 'G-Block';


  @override
  Widget build(BuildContext context) =>
      Scaffold(resizeToAvoidBottomInset:false ,
          appBar: AppBar(
            title: Text(MyApp.title),
          ),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Scan Result',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      '$barcode',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 32),
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

                    GestureDetector(
                      onTap: () =>
                          DialogUtils.showCustomDialog(context,
                              title: "Message",


                              cancelBtnText: "Cancel",

                      child: Container(),
                    )
                    )

                  ]
              )
          )
      );
}

