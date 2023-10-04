import 'package:flutter/material.dart';

import 'package:regexed_validator/regexed_validator.dart';

class ServerAddingWidget extends StatelessWidget {
  const ServerAddingWidget(
      {super.key,
      required this.ip,
      required this.serverName,
      required this.onAddClicked});
  final TextEditingController serverName;
  final VoidCallback onAddClicked;
  final TextEditingController ip;

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 230,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      width: 700,
      color: Color.fromARGB(255, 32, 31, 31),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Connect by address',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  backgroundColor: Color.fromARGB(255, 32, 31, 31)),
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'IP address or hostname',
              style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Color.fromARGB(255, 32, 31, 31)),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: serverName,
            style: TextStyle(color: Colors.white),
            validator: (value2) {
              if (value2!.isEmpty) {
                return "Enter Server name";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            style: TextStyle(color: Colors.white),
            controller: ip,
            validator: (value) {
              if (value == null || !validator.ip(value)) {
                return "Enter correct ip address";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          OutlinedButton(
            onPressed: onAddClicked,
            child: Text(
              'Add',
            ),
          ),
        ],
      ),
    );
  }
}
