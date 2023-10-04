import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'server_model.g.dart';

@HiveType(typeId: 0)
class Server extends Equatable {
  @HiveField(0)
  final String server_name;
  @HiveField(1)
  final String ip_address;
  @HiveField(2)
  final int buffer;
  @HiveField(3)
  final double max;
  @HiveField(4)
  final double average;

  const Server(
      {required this.server_name,
      required this.ip_address,
      required this.buffer,
      required this.max,
      required this.average});

  @override
  List<Object?> get props => [ip_address];
}
