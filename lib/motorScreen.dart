import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MotorScreen extends StatefulWidget {
  static const String routeName = "/motorScreen";
  @override
  _MotorScreenState createState() => _MotorScreenState();
}

class _MotorScreenState extends State<MotorScreen> {
  bool motorStatus = false;
  bool value = false;
  final dbRef = FirebaseDatabase.instance
      .reference(); // This reference is uesd for assessing a database

  onUpdate() {
    setState(() {
      value = !value; //Toggles between true and false
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Motor Control",
        ),
      ),
      body: StreamBuilder(
        stream: dbRef.child("Data").onValue,
        builder: (context, snapshot) {
          // if (snapshot.hasData &&
          //     !snapshot.hasError &&
          //     snapshot.data.snapshot.value != null) {
          return Center(
            child: FloatingActionButton.extended(
              onPressed: () {
                onUpdate();
                // write data on firebase so that our motor can repsond to it
                writeData();
              },
              label: value ? Text("ON") : Text("OFF"),
              elevation: 20,
              backgroundColor: value ? Colors.yellow : Colors.white,
              icon: value
                  ? Icon(Icons.visibility)
                  : Icon(Icons
                      .visibility_off), //an-eye icon also used for viewing pswd
            ),
          );
          // }
          return Container();
        },
      ),
    );
  }

  Future<void> writeData() {
    // below is "data node " for light and water sensor
    //dbRef.child("Data").set({"Light:": 0, "Water Sensor:": 0});// no need of this
    // we need to listen to the changes in the "light" and "Water" vales and for this we have to use StreamBuilder
    // StreamBuilder Widget in this app has a stream on "dbRef.onValue", this widget will listen to any changes in
    // the stream whenvever a new value of sensors is received in the database, the value in the app changes.ss
    dbRef.child("MotorState").set({"switch": !value});
  }
}
