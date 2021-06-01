import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SingleSensorScreen extends StatefulWidget {
  static const String routeName = "/singleSensorScreen";
  @override
  _SingleSensorScreenState createState() => _SingleSensorScreenState();
}

class _SingleSensorScreenState extends State<SingleSensorScreen> {
  @override
  bool value = false;
  final dbRef = FirebaseDatabase.instance
      .reference(); // This reference is uesd for assessing a database

  onUpdate() {
    setState(() {
      value = !value; //Toggles between true and false
    });
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sensor Data"),
      ),
      body: StreamBuilder(
          stream: dbRef.child("Data").onValue,
          builder: (context, snapshot) {
            // if (snapshot.hasData) {
            return Column(
              children: [
                // Padding(
                //   padding: EdgeInsets.all(18),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Icon(
                //         Icons.clear_all,
                //         color: Colors.black,
                //       ),
                //       // Text(
                //       //   "MY ROOM",
                //       //   style: TextStyle(
                //       //       fontSize: 20, fontWeight: FontWeight.bold),
                //       // ),
                //       Icon(Icons.settings)
                //     ],
                //   ),
                // ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "LDR Value",
                            style: TextStyle(
                                // color: value ? Colors.yellow : Colors.white,
                                color: Colors.grey,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data.snapshot.value["LDR"]
                                .toString(), //dummy data for now
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Rainfall Value",
                        style: TextStyle(
                            // color: value ? Colors.yellow : Colors.white,
                            color: Colors.grey,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        snapshot.data.snapshot.value["Rainfall"]
                            .toString(), //dummy data for now
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                //  SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Humidity Value",
                            style: TextStyle(
                                // color: value ? Colors.yellow : Colors.white,
                                color: Colors.grey,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data.snapshot.value["Humidity"]
                                .toString(), //dummy data for now
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Temperature Value",
                            style: TextStyle(
                                // color: value ? Colors.yellow : Colors.white,
                                color: Colors.grey,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data.snapshot.value["Temp"]
                                .toString(), //dummy data for now
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Soil Moisture Value",
                            style: TextStyle(
                                // color: value ? Colors.yellow : Colors.white,
                                color: Colors.grey,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data.snapshot.value["Soil"]
                                .toString(), //dummy data for now
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
              ],
            );
            // } else
            return Container();
          }),
    );
  }

  Future<void> writeData() {
    // below is "data node " for light and water sensor
    //dbRef.child("Data").set({"LDR": 0, "Rainfall": 0}); // no need of this
    // we need to listen to the changes in the "light" and "Water" vales and for this we have to use StreamBuilder
    // StreamBuilder Widget in this app has a stream on "dbRef.onValue", this widget will listen to any changes in
    // the stream whenvever a new value of sensors is received in the database, the value in the app changes.ss
    dbRef.child("MotorState").set({"switch": !value});
  }
}
