import 'package:cbc_online/firebase/firebase_provider.dart';
import 'package:cbc_online/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            ElevatedButton(
                onPressed: () async {
                  bool success =
                      await context.read<FirebaseProvider>().signOut(context);
                  if (success) {
                    Navigator.pushReplacementNamed(context, authcheckPath);
                  }
                },
                child: const Text("Logout"))
          ],
        )),
      ),
    );
  }
}
