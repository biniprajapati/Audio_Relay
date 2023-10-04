import "package:bini_flutter/index.dart";

import 'package:bini_flutter/models/server_model.dart';
import 'package:bini_flutter/screens/tabs/server.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerConnected extends StatefulWidget {
  const PlayerConnected({super.key, required this.connectedServer});
  final Server connectedServer;

  @override
  State<PlayerConnected> createState() => _PlayerConnectedState();
}

class _PlayerConnectedState extends State<PlayerConnected> {
  int _secondsElapsed = 0;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _secondsElapsed++;
      });
    });
  }

  void dispose() {
    // Cancel the timer when the screen is disposed to prevent memory leaks.
    _timer.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            // height: 100,

            color: Color.fromARGB(255, 32, 31, 31),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Text(
                          widget.connectedServer.server_name,
                          style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Color.fromARGB(255, 32, 31, 31),
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.mic,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${formatTime(_secondsElapsed)}',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.connectedServer.ip_address,
                    style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Color.fromARGB(255, 32, 31, 31)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(onPressed: () {}, child: Text('MUTE PC')),
                    ElevatedButton(
                        onPressed: () {
                          _timer.cancel();

                          context.read<ServerConectionCubit>().disconnect();
                        },
                        child: Text(
                          'STOP',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 170,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            width: 700,
            color: Color.fromARGB(255, 32, 31, 31),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Audio Output',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        backgroundColor: Color.fromARGB(255, 32, 31, 31)),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Changing the output could help solve volume or quality issues',
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Color.fromARGB(255, 32, 31, 31)),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Dismiss',
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text('CHANGE'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 170,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            width: 700,
            color: Color.fromARGB(255, 32, 31, 31),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(children: [
                      Icon(Icons.music_note_outlined),
                    ]),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BUFFER',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '0',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(children: [Icon(Icons.wifi)]),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Latency',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Average',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '0 ms',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Max',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '0 ms',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
