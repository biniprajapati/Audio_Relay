import "package:bini_flutter/index.dart";
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServerAddedWidget extends StatelessWidget {
  const ServerAddedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServerDataCubit, ServerDataState>(
        builder: (context, state) {
      print("Servers count:- ${state.servers.length}");

      return state is ServerDataInitial
          ? SizedBox(
              height: 0,
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: state.servers.length,
              itemBuilder: (context, index) {
                final server = state.servers[index];
                return InkWell(
                  onTap: () {
                    context
                        .read<ServerConectionCubit>()
                        .connect(server: state.servers[index]);
                  },
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Icon(Icons.stream_outlined,
                                  color: Colors.white))),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 7,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(server.server_name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  )),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(server.ip_address,
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Align(
                              alignment: Alignment.topRight,
                              child: OutlinedButton(
                                  onPressed: () {
                                    // context
                                    //     .read<ServerDataCubit>()
                                    //     .removeServer(server, index);
                                  },
                                  child: Icon(Icons.delete,
                                      color: Colors.white)))),
                    ],
                  ),
                );
              });
    });
  }
}
