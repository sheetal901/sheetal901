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
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        

        body: Padding(

          padding: EdgeInsets.all(15),
          child: Column(
              children: <Widget>[
                SizedBox(height:30),
     CircleAvatar(

       backgroundImage: AssetImage('images/addmoney.png'),


    radius: 70,


     ),
                SizedBox(height:70),
                Padding(
                  padding: EdgeInsets.all(15),


                  child: TextField(
                    controller: _controller,

                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                      LimitRangeTextInputFormatter(0, 500),
                    ],
   

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                   labelText: 'Enter Amount',
                      hintText: 'Enter Amount less than 500',

                      suffixIcon: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.black,
                          ),
                          splashColor: Colors.black,
                          onPressed: () {
                            _controller.clear();

                          }),


    ),
                    ),

                ),

      SizedBox(height:20),

            RaisedButton(
                  textColor: Colors.white,
                  color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
                  child: Text('Confirm to pay',
              style: TextStyle(fontSize: 32.0),
                  ),
                  onPressed: () {
                    showAlertDialog(context);
                  },
                ),
                SizedBox(height:60),
       RaisedButton(
         textColor: Colors.white,
         color: Colors.black,
         shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(10)),

        child: Text('Click to check balance',
          style: TextStyle(fontSize: 32.0),
        ),
        onPressed: () {
          _navigateToNextScreen(context);


        },
       ),
   ]
    ),
    )
    );


  }


  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewScreen()));
  }
}

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
        (title: Text('Available Balance'),
        backgroundColor: Colors.black,),

      body: Center(


        child: Text(
          'Your available balance is 500Rs',
          style: TextStyle(fontSize: 24.0),

        ),
      ),
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
    title: Text("Message",style: TextStyle(color: Colors.white),),

    content: Text("Money credited to your wallet",style: TextStyle(color: Colors.white),),
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

