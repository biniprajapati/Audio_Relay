part of 'server_data_cubit.dart';

class ServerDataState {
  List<Server> servers;
  ServerDataState({required this.servers});
}

class ServerDataInitial extends ServerDataState {
  ServerDataInitial() : super(servers: []);
}

class ServerDataLoaded extends ServerDataState {
  ServerDataLoaded({required List<Server> data}) : super(servers: data);
}

class ServerDataAdded extends ServerDataState {
  ServerDataAdded({required List<Server> data}) : super(servers: data);
}

class ServerDataRemoved extends ServerDataState {
  ServerDataRemoved({required List<Server> data}) : super(servers: data);
}
