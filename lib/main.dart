import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:servo_app/connection.dart';
import 'package:servo_app/led.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Car Controller',
      home: FutureBuilder(
        future: FlutterBluetoothSerial.instance.requestEnable(),
        builder: (context, future) {
          if (future.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Container(
                height: double.infinity,
                child: Center(
                  child: Icon(
                    Icons.bluetooth_disabled,
                    size: 200.0,
                    color: Colors.black12
                    ,
                  ),
                ),
              ),
            );
          } else {
            return Home();
          }
        },
        // child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xffFDDD1C) ,
        centerTitle: true,
        title: Text('Connection',style: TextStyle(color: Colors.black,            
                fontSize: 23,
                fontWeight: FontWeight.bold 
        )),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

            colors: <Color>[
              Color(0xFF09A0FF),
              Color(0xFFA7D5FA),
              // Color(0xFF42A5F5),
            ],
          ),
        ),
        child: SelectBondedDevicePage(
          onCahtPage: (device1) {
            BluetoothDevice device = device1;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ChatPage(server: device);
                },
              ),
            );
          },
        ),
      ),
    ));
  }
}
