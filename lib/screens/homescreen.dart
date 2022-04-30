import 'package:cbc_online/firebase/firebase_cloud_methods.dart';
import 'package:cbc_online/firebase/firebase_provider.dart';
import 'package:cbc_online/global_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/learner_model.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    User firebaseUser = context.read<FirebaseProvider>().firebaseUser;
    Future<Learner?> _learner = getLearner(firebaseUser.uid, context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark),
          actions: [
            Row(
              children: const [
                Icon(
                  Icons.man,
                  color: Colors.black,
                )
              ],
            )
          ],
        ),
        body: FutureBuilder(
            future: _learner,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.data == null) {
                return const Center(child: Text("Error"));
              }
              return Container(
                child: Center(
                    child: Column(
                  children: [
                    Text("Name: ${(snapshot.data as Learner).firstName}"),
                    const Text("Home"),
                    ElevatedButton(
                        onPressed: () async {
                          bool success = await context
                              .read<FirebaseProvider>()
                              .signOut(context);
                          if (success) {
                            Navigator.pushReplacementNamed(
                                context, authcheckPath);
                          }
                        },
                        child: const Text("Logout"))
                  ],
                )),
              );
            }));
  }

  Future<Learner?> getLearner(String s, BuildContext context) async {
    return await FirebaseCloudMethods().getAuthenticatedLearner(s, context);
  }
}
