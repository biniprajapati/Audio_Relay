import 'package:bini_flutter/widgets/server_added.dart';
import 'package:flutter/material.dart';

class ServersListWidget extends StatelessWidget {
  const ServersListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      width: 390,
      color: Color.fromARGB(255, 32, 31, 31),
      child: Column(
        children: [
          ServerAddedWidget(),
        ],
      ),
    );
  }
}
