import 'package:flutter/material.dart';

class Nointernet extends StatelessWidget {
  const Nointernet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(
              Icons.wifi_off,
              size: 100,
              color: Colors.red,
            ),
            Text(
              'No Internet Connection',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
