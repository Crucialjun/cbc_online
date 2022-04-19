import 'package:flutter/material.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          children: [
            const Text("Home"),
            ElevatedButton(onPressed: () {}, child: const Text("Logout"))
          ],
        )),
      ),
    );
  }
}
