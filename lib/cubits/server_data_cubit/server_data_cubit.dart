import 'package:hive/hive.dart';

import 'package:bini_flutter/models/server_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'server_data_state.dart';

class ServerDataCubit extends Cubit<ServerDataState> {
  ServerDataCubit() : super(ServerDataInitial());

//!code for Hive Database//
//hive box initialization
  var _userBox;

//!function to load server data from hive //

  void loadServer() {
    _userBox = Hive.box('server_box');

    final users = _userBox.values.cast<Server>().toList();
    print("aa");
    emit(ServerDataAdded(data: users));
  }

//!function to add server data to hive //

  void addServer(Server server) async {
    final List<Server> currntState = state.servers;
    print("bb");
    if (!currntState.contains(server)) {
      print("cc");

      _userBox.add(server);
      final users = _userBox.values.cast<Server>().toList();
      print("dd");

      emit(ServerDataAdded(data: users));
    }
  }
}

//!code for Hive Database//


//!code for SharedPreferences//

//!function to load servers from local database//
// void loadServer(List<Server> user) {
  //   emit(ServerDataAdded(data: user));
  // }

//!function to add particular server to local database//
//   void addServer(Server server) async {
//     final List<Server> currntState = state.servers;
//     List<Server> updatedList = [];
//     updatedList.addAll(currntState);
//     if (!updatedList.contains(server)) {
//       updatedList.add(server);
//     } else {
//       print("found");
//     }
//     saveServers(updatedList);

//     emit(ServerDataAdded(data: updatedList));
//   }
// }
//!function to remove particular server from local database//
// void removeServer(Server server, int index) async {
//   final currentState = state.servers;

//   if (index >= 0 && index <= currentState.length) {
//     List<Server> updatedList = List.from(currentState);
//     updatedList.remove(server);
//     deleteServers();
//     saveServers(updatedList);

//     emit(ServerDataRemoved(data: updatedList));
//   }
// }

//!function to convert dart object to json format//
//   List<Map<String, dynamic>> serversToJson(List<Server> servers) {
//     return servers
//         .map((server) => {
//               'server_name': server.server_name,
//               'buffer': server.buffer,
//               'ip_address': server.ip_address,
//               'max': server.max,
//               'average': server.average,
//             })
//         .toList();
//   }

//!function to save particular server to  local database//
//   Future<void> saveServers(List<Server> servers) async {
//     final prefs = await SharedPreferences.getInstance();

//     final serverList = serversToJson(servers);
//     prefs.setStringList(
//         'servers', serverList.map((e) => jsonEncode(e)).toList());
//     print("Saved");
//   }

//   Future<void> deleteServers() async {
//     final prefs = await SharedPreferences.getInstance();

//     prefs.remove('server');
//   }
// }
//!code for SharedPreferences//
