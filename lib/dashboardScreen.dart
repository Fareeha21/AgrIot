import 'package:agriot/homepageScreen.dart';
import 'package:agriot/widgets/customButton.dart';
import 'package:agriot/widgets/customTextField.dart';
import 'package:agriot/widgets/drawerIcon.dart';
import 'package:agriot/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = "/dashboardScreen";
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String dropdownValue = "1";
  bool humiditySensor = false;
  bool moistureSensor = false;
  bool lightSensor = false;
  bool tempSensor = false;
  bool soilSensor = false;
  bool rainfallSensor = false;

  int status =
      0; //0 means form not submitted, 1 means submitted but waiting for api key and 2 means user registered in thingspeak

  TextEditingController controllerPlantNames = TextEditingController();
  TextEditingController controllerApiKey = TextEditingController();

  @override
  void initState() {
    Future.delayed(
      Duration(
        milliseconds: 500,
      ),
    ).then((res) {
      initDialog();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DrawerWidget(),
      appBar: AppBar(
        // leading: DrawerIcon(),
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: StreamBuilder(
            stream: Stream.empty(),
            builder: (context, snapshot) {
              return SingleChildScrollView(
                child: status == 0
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 300),
                        child: CustomButton(
                          text: "Open Form",
                          onPressed: () {
                            initDialog();
                          },
                        ),
                      )
                    : status == 1
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 100,
                              ),
                              Text(
                                "We will respond you soon",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "We received your data. You will receive an email from us in 24 hours containing your credentials",
                                textAlign: TextAlign.center,
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //     top: 100.0,
                              //     bottom: 20,
                              //   ),
                              //   child: Text(
                              //     "Please enter your API Credentials if you received them",
                              //     style: TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 20,
                              //     ),
                              //   ),
                              // ),
                              // CustomTextField(
                              //   label: "API KEY",
                              //   controller: controllerApiKey,
                              //   icon: Icons.api,
                              // ),
                              SizedBox(
                                height: 80,
                              ),
                              CustomButton(
                                text: "Go To Homepage",
                                onPressed: () {
                                  // if (controllerApiKey.text.isEmpty) {
                                  //   return;
                                  // }
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      HomepageScreen.routeName,
                                      (route) => false);
                                },
                              )
                            ],
                          )
                        : status == 2
                            ? Container()
                            //  Column(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       // SizedBox(
                            //       //   height: 100,
                            //       // ),

                            //       SizedBox(
                            //         height: 20,
                            //       ),
                            //       Text(
                            //         "We received your data. You will receive an email from us in 24 hours containing your credentials",
                            //         textAlign: TextAlign.center,
                            //       ),
                            //     ],
                            //   )
                            : Container(),
              );
            }),
      ),
    );
  }

  void initDialog() async {
    showDialog(
        context: context,
        builder: (
          ctx,
        ) {
          return AlertDialog(
            title: Text(
              "Please give required information",
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: StatefulBuilder(
                builder: (
                  ctx,
                  setDialogState,
                ) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        maxLines: 7,
                        decoration: InputDecoration(
                          labelText: "Plant Names",
                          border: OutlineInputBorder(),
                        ),
                        controller: controllerPlantNames,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          bottom: 15.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                "How many farms do you \n the services for?",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            DropdownButton<String>(
                              value: dropdownValue,
                              items: <String>['1', '2', '3', '4']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (val) {
                                print("NEW VALUE  = " + val);
                                setDialogState(() {
                                  dropdownValue = val;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Choose Sensors",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CheckboxListTile(
                          title: Text("Himidity"),
                          value: humiditySensor,
                          onChanged: (val) {
                            setDialogState(() {
                              humiditySensor = val;
                            });
                          }),
                      CheckboxListTile(
                          title: Text("Moisture"),
                          value: moistureSensor,
                          onChanged: (val) {
                            setDialogState(() {
                              moistureSensor = val;
                            });
                          }),
                      CheckboxListTile(
                          title: Text("Light"),
                          value: lightSensor,
                          onChanged: (val) {
                            setDialogState(() {
                              lightSensor = val;
                            });
                          }),
                      CheckboxListTile(
                          title: Text("Temperature"),
                          value: tempSensor,
                          onChanged: (val) {
                            setDialogState(() {
                              tempSensor = val;
                            });
                          }),
                      CheckboxListTile(
                          title: Text("Soil"),
                          value: soilSensor,
                          onChanged: (val) {
                            setDialogState(() {
                              soilSensor = val;
                            });
                          }),
                      CheckboxListTile(
                          title: Text("Rainfall"),
                          value: rainfallSensor,
                          onChanged: (val) {
                            setDialogState(() {
                              rainfallSensor = val;
                            });
                          }),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        alignment: Alignment.center,
                        child: CustomButton(
                          text: "Submit",
                          onPressed: () async {
                            final Email email = Email(
                              body: controllerPlantNames.text,
                              subject: 'REQUEST FOR THINGSPEAK API KEY',
                              recipients: ['fareehahameed21@gmail.com'],
                              // cc: ['cc@example.com'],
                              // bcc: ['bcc@example.com'],
                              // attachmentPaths: ['/path/to/attachment.zip'],
                              isHTML: false,
                            );

                            await FlutterEmailSender.send(email);
                            setState(() {
                              status = 1;
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        });
  }
}
