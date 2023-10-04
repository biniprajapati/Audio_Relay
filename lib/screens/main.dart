import 'package:bini_flutter/models/server_model.dart';
import 'package:bini_flutter/screens/tabs/player_connected.dart';
import 'package:bini_flutter/screens/tabs/player_disconnected.dart';
import 'package:bini_flutter/screens/tabs/server.dart';
import 'package:bini_flutter/screens/tabs/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import "package:bini_flutter/index.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ServerAdapter());
  await Hive.openBox('server_box');

  runApp(MaterialApp(home: Card()));
}

class Card extends StatefulWidget {
  const Card({Key? key}) : super(key: key);

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ServerConectionCubit>(
          create: (context) => ServerConectionCubit(),
        ),
        BlocProvider<ServerDataCubit>(
          create: (context) => ServerDataCubit(),
        ),
      ],
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'Player',
                  ),
                  Tab(
                    text: 'Server',
                  ),
                  Tab(
                    text: 'Settings',
                  ),
                ],
              ),
              title: Text("Audio Relay"),
              backgroundColor: Color.fromARGB(255, 32, 31, 31),
              elevation: 0.0,
            ),
            body: TabBarView(
              children: [Player(), server(), settings()],
            )),
      ),
    );
  }
}

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  void initState() {
    super.initState();
    loadServers();
  }

  loadServers() async {
    // final prefs = await SharedPreferences.getInstance();
    // final serverListJson = prefs.getStringList('servers');
    // if (serverListJson != null) {
    //   List<Server> servers =
    //       serversFromJson(serverListJson.map((e) => jsonDecode(e)).toList());
    //   print("data loaded.");
    //   print(servers.length);
    // context.read<ServerDataCubit>().loadServer(servers);
    context.read<ServerDataCubit>().loadServer();
  }

  List<Server> serversFromJson(List<dynamic> jsonList) {
    return jsonList
        .map((json) => Server(
              server_name: json['server_name'],
              buffer: json['buffer'],
              ip_address: json['ip_address'],
              max: json['max'],
              average: json['average'],
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: BlocBuilder<ServerConectionCubit, ServerConectionState>(
      builder: (context, state) {
        if (state is ServerConnected) {
          return PlayerConnected(connectedServer: state.server);
        } else {
          return PlayerDisconnected();
        }
      },
    ));
  }
}
