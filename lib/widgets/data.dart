import '/widgets/button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '/widgets/card.dart';

int moisture_value = 0;
int pump_value = 0;
double humi_value = 0;
double temp_value = 0.0;
double battcurrent_value = 0.0;
double battvoltage_value = 0.0;
double syscurrent_value = 0.0;
double syspower_value = 0.0;

class displayData extends StatefulWidget {
  @override
  _displayDataState createState() => _displayDataState();
}

class _displayDataState extends State<displayData> {
  DatabaseReference moistureRef = FirebaseDatabase.instance.ref("Sensors/Moisture");
  DatabaseReference temperatureRef = FirebaseDatabase.instance.ref("Sensors/Temperature");
  DatabaseReference humidityRef = FirebaseDatabase.instance.ref("Sensors/Humidity");
  DatabaseReference pumpRef = FirebaseDatabase.instance.ref("Actuators/Pump");
  DatabaseReference battcurrentRef = FirebaseDatabase.instance.ref("Power/Battery/Current");
  DatabaseReference battvoltageRef = FirebaseDatabase.instance.ref("Power/Battery/Voltage");
  DatabaseReference syscurrentRef = FirebaseDatabase.instance.ref("Power/System/Current");
  DatabaseReference syspowerRef = FirebaseDatabase.instance.ref("Power/System/Power");

  @override
  Widget build(BuildContext context) {
    listeners();
    return Container(
        //color: Colors.white,
        //height: 50,
        //width: 300,
        child: Column(
      children: [
        // Text("LDR: " + ldr_value.toString()),
        // Text("Moisture: " + moisture_value.toString()),
        // Text("Light: " + light_value.toString()),
        // Text("Pump: " + pump_value.toString()),
        // Text("Temp: " + temp_value.toString()),
        // Text("Humi: " + humi_value.toString()),
        //Button(() => _functionHandlerLight(), "Light:", light_value, Icons.lightbulb_circle_outlined),
        Button(() => _functionHandlerPump(), "Pump:", pump_value, Icons.water_drop_outlined),
        SizedBox(height: 20, width: double.infinity),

        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(143, 198, 64, 1), borderRadius: BorderRadius.circular(20)),
              height: 130,
              width: 180,
              //color: Colors.green[400],
              child: Column(
                children: [
                  SizedBox(height: 10, width: double.infinity),
                  Text(
                    "System Usage",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.green[50],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 3, width: double.infinity),
                  dataCard("Power:", "${syspower_value.toStringAsFixed(2)} Wh", Icons.electric_meter, 16, 20),
                  dataCard("Current:", "${syscurrent_value.toStringAsFixed(2)} A", Icons.electric_bolt, 16, 20),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(143, 198, 64, 1), borderRadius: BorderRadius.circular(20)),
              height: 130,
              width: 180,
              //color: Colors.green[400],
              child: Column(
                children: [
                  SizedBox(height: 10, width: double.infinity),
                  Text(
                    "Battery Status",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.green[50],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 3, width: double.infinity),
                  dataCard("Voltage:", "${battvoltage_value.toStringAsFixed(2)} V", Icons.power_input, 16, 20),
                  dataCard("Current:", "${battcurrent_value.toStringAsFixed(2)} A", Icons.electric_bolt, 16, 20),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10, width: double.infinity),
        Container(
          decoration: BoxDecoration(color: Color.fromRGBO(143, 198, 64, 1), borderRadius: BorderRadius.circular(20)),
          height: 150,
          width: 370,
          child: Column(
            children: [
              SizedBox(height: 10, width: double.infinity),
              Text(
                "Sensors Data",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.green[50],
                ),
                textAlign: TextAlign.right,
              ),
              //SizedBox(height: 10, width: double.infinity),
              dataCard("Temperature:", "$temp_value°C", Icons.thermostat, 18, 20),
              dataCard("Humidity:", "$humi_value%", Icons.water_damage, 18, 20),
              dataCard("Soil:", moisture_value == 1 ? "Wet" : "Dry", Icons.water, 18, 20),
            ],
          ),
        ),
      ],
    ));
  }

  void _functionHandlerPump() async {
    pump_value = 1 - pump_value;
    await pumpRef.set(pump_value);
    setState(() {});
  }

  void listeners() {
    moistureRef.onValue.listen((DatabaseEvent event) {
      if (moisture_value != event.snapshot.value as int) {
        moisture_value = event.snapshot.value as int;
        setState(() {});
      }
      //updateStarCount(data);
    });
    pumpRef.onValue.listen((DatabaseEvent event) {
      if (pump_value != event.snapshot.value as int) {
        pump_value = event.snapshot.value as int;
        setState(() {});
      }
      //updateStarCount(data);
    });
    temperatureRef.onValue.listen((DatabaseEvent event) {
      if (temp_value != event.snapshot.value as double) {
        temp_value = event.snapshot.value as double;
        setState(() {});
      }
      //updateStarCount(data);
    });
    humidityRef.onValue.listen((DatabaseEvent event) {
      if (humi_value != event.snapshot.value as double) {
        humi_value = event.snapshot.value as double;
        setState(() {});
      }
      //updateStarCount(data);
    });
    battcurrentRef.onValue.listen((DatabaseEvent event) {
      if (battcurrent_value != event.snapshot.value as double) {
        battcurrent_value = event.snapshot.value as double;
        setState(() {});
      }
      //updateStarCount(data);
    });
    battvoltageRef.onValue.listen((DatabaseEvent event) {
      if (battvoltage_value != event.snapshot.value as double) {
        battvoltage_value = event.snapshot.value as double;
        setState(() {});
      }
      //updateStarCount(data);
    });
    syscurrentRef.onValue.listen((DatabaseEvent event) {
      if (syscurrent_value != event.snapshot.value as double) {
        syscurrent_value = event.snapshot.value as double;
        setState(() {});
      }
      //updateStarCount(data);
    });
    syspowerRef.onValue.listen((DatabaseEvent event) {
      if (temp_value != event.snapshot.value as double) {
        syspower_value = event.snapshot.value as double;
        setState(() {});
      }
      //updateStarCount(data);
    });
  }
}
