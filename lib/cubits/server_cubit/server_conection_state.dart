part of 'server_conection_cubit.dart';

@immutable
sealed class ServerConectionState {}

final class ServerConectionInitial extends ServerConectionState {}

final class ServerConnected extends ServerConectionState {
  final Server server;
  ServerConnected({required this.server});
}

final class ServerDisConnected extends ServerConectionState {}
