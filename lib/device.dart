import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothDeviceListEntry extends StatelessWidget {
  final Function onTap;
  final BluetoothDevice device;

  BluetoothDeviceListEntry({this.onTap, @required this.device});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(Icons.devices,color:Colors.white),
      title: Text(device.name ?? "Unknown device",style:TextStyle(color:Colors.white)),
      subtitle: Text(device.address.toString(),style:TextStyle(color:Colors.white)),
      trailing: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffEB0B0E),
            borderRadius: BorderRadius.circular(30),
          ),
          width: 100,
          height: 30,         
          child: Center(child: Text('Connect',style: TextStyle(color: Colors.white),))),
        onTap: onTap,
      ),
    );
  }
}
