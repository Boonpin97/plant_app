import '/widgets/button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '/widgets/card.dart';

int ldr_value = 0;
int moisture_value = 0;
int light_value = 0;
int pump_value = 0;
double temp_value = 0.0;
int humi_value = 0;
String log_value = "NULL";

class displayData extends StatefulWidget {
  @override
  _displayDataState createState() => _displayDataState();
}

class _displayDataState extends State<displayData> {
  DatabaseReference ldrRef = FirebaseDatabase.instance.ref("sensor/ldr");
  DatabaseReference moistureRef = FirebaseDatabase.instance.ref("sensor/moisture");
  DatabaseReference temperatureRef = FirebaseDatabase.instance.ref("sensor/temperature");
  DatabaseReference humidityRef = FirebaseDatabase.instance.ref("sensor/humidity");
  DatabaseReference lightRef = FirebaseDatabase.instance.ref("actuator/light");
  DatabaseReference pumpRef = FirebaseDatabase.instance.ref("actuator/pump");
  DatabaseReference logRef = FirebaseDatabase.instance.ref("message");

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
        Button(() => _functionHandlerLight(), "Light:", light_value, Icons.lightbulb_circle_outlined),
        Button(() => _functionHandlerPump(), "Pump:", pump_value, Icons.water_drop_outlined),
        SizedBox(height: 20, width: double.infinity),
        Container(
          decoration: BoxDecoration(color: Colors.green[400], borderRadius: BorderRadius.circular(20)),
          height: 200,
          width: 370,
          //color: Colors.green[400],
          child: Column(
            children: [
              dataCard("Temperature:", "$temp_value°C", Icons.thermostat),
              dataCard("Brightness:", light_value == 1 ? "High" : "Low", Icons.sunny),
              dataCard("Humidity:", "$humi_value%", Icons.water_damage),
              dataCard("Moisture:", (moisture_value / 10.23).toStringAsPrecision(2) + "%", Icons.water),
              //logCard("Logs:", log_value)
            ],
          ),
        )
      ],
    ));
  }

  void _functionHandlerLight() async {
    light_value = 1 - light_value;
    await lightRef.set(light_value);
    setState(() {});
  }

  void _functionHandlerPump() async {
    pump_value = 1 - pump_value;
    await pumpRef.set(pump_value);
    setState(() {});
  }

  void listeners() {
    logRef.onValue.listen((DatabaseEvent event) {
      if (log_value != event.snapshot.value as String) {
        log_value = event.snapshot.value as String;
        setState(() {});
      }
      //updateStarCount(data);
    });
    ldrRef.onValue.listen((DatabaseEvent event) {
      if (ldr_value != event.snapshot.value as int) {
        ldr_value = event.snapshot.value as int;
        setState(() {});
      }
      //updateStarCount(data);
    });
    moistureRef.onValue.listen((DatabaseEvent event) {
      if (moisture_value != event.snapshot.value as int) {
        moisture_value = event.snapshot.value as int;
        setState(() {});
      }
      //updateStarCount(data);
    });
    lightRef.onValue.listen((DatabaseEvent event) {
      if (light_value != event.snapshot.value as int) {
        light_value = event.snapshot.value as int;
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
      if (humi_value != event.snapshot.value as int) {
        humi_value = event.snapshot.value as int;
        setState(() {});
      }
      //updateStarCount(data);
    });
  }
}
