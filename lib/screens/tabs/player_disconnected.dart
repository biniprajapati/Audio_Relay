import "package:bini_flutter/index.dart";

import 'package:bini_flutter/widgets/server_adding_widget.dart';
import 'package:bini_flutter/widgets/server_list_widget.dart';

import 'package:bini_flutter/data/server_data.dart';
import 'package:bini_flutter/models/server_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:hive/hive.dart';

class PlayerDisconnected extends StatefulWidget {
  const PlayerDisconnected({Key? key}) : super(key: key);
  @override
  _PlayerDisconnectedState createState() => _PlayerDisconnectedState();
}

class _PlayerDisconnectedState extends State<PlayerDisconnected> {
  TextEditingController ip = TextEditingController();
  TextEditingController serverName = TextEditingController();
  var _formkey = GlobalKey<FormState>();

  bool texterror = false;
  bool checkServerExists(String servername, String ipAddress) {
    for (Server server in servers) {
      if (server.server_name == servername && server.ip_address == ipAddress) {
        return true;
      }
    }
    return false;
  }

  Future<void> _submit() async {
    final isValid = _formkey.currentState?.validate();
    if (!isValid!) {
      return;
    }

    final Server newServer = Server(
        server_name: serverName.text,
        ip_address: ip.text,
        buffer: 40,
        average: 0.4,
        max: 5.0);

    context.read<ServerDataCubit>().addServer(newServer);
  }

  @override
  void initState() {
    ip.text = "ip";
    serverName.text = "";

    super.initState();
  }

  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ServersListWidget(),
                SizedBox(
                  height: 20,
                ),
                ServerAddingWidget(
                  ip: ip,
                  serverName: serverName,
                  onAddClicked: _submit,
                ),
                SizedBox(height: 20),
                Container(
                  width: 400,
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  // height: 200,
                  color: Color.fromARGB(255, 32, 31, 31),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "USB tendering",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Icon(Icons.question_mark),
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Reduce delays and audio artifacts by senmding the audio over USB",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Note that some manufactureres have moved the option to another screen",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: OutlinedButton(
                            onPressed: () {}, child: Text("Settings")))
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
