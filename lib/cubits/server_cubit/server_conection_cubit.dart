import 'package:bini_flutter/models/server_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'server_conection_state.dart';

class ServerConectionCubit extends Cubit<ServerConectionState> {
  ServerConectionCubit() : super(ServerConectionInitial());

  connect({required Server server}) {
    emit(ServerConnected(server: server));
  }

  disconnect() {
    emit(ServerDisConnected());
  }
}
