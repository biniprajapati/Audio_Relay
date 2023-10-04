import 'package:flutter/material.dart';

class server extends StatelessWidget {
  const server({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    child: SizedBox(
                      width: 400,
                      height: 90,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color.fromARGB(255, 32, 31, 31)),
                          ),
                          onPressed: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(Icons.mic_external_off_outlined),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Microphone',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text('Stream your mic to another device'),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 400,
              height: 100,
              child: Column(
                children: [
                  Container(
                    child: SizedBox(
                      width: 400,
                      height: 90,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color.fromARGB(255, 32, 31, 31)),
                          ),
                          onPressed: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(Icons.stream_outlined),
                                  SizedBox(width: 10),
                                  Text(
                                    'Apps',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                  'Stream the sound of your apps toanother device'),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
