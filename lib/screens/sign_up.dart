import 'package:cbc_online/gen/assets.gen.dart';
import 'package:cbc_online/utils/buttons_decoration.dart';
import 'package:cbc_online/utils/textform_decorator.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Create an",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                ),
                const Text(
                  "Account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 52),
                ),
                const Text(
                  "Create an account and get unlimited access",
                  style: TextStyle(fontSize: 18),
                ),
                const Text(
                  "to our learning materials!",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Your First Name",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            decoration:
                                const TextFormDecorator(hintString: "John"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Your Last Name",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            decoration:
                                const TextFormDecorator(hintString: "Doe"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Your Email Address",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration:
                      const TextFormDecorator(hintString: "yourname@email.com"),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Set Password",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: const TextFormDecorator(hintString: "********"),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: const TextFormDecorator(hintString: "********"),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  decoration: ButtonsDecoration(),
                  width: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child: const Divider(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Or via social media",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Container(
                        child: const Divider(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 37, 119, 242),
                            borderRadius: BorderRadius.circular(12)),
                        width: double.infinity,
                        height: 58,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: Image.asset(Assets.pngs.facebooktwo.path),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 2, color: Colors.red),
                            borderRadius: BorderRadius.circular(12)),
                        height: 58,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: Image.asset(Assets.pngs.google.path),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Already have an account?"),
                    SizedBox(
                      width: 4,
                    ),
                    Text("Sign In"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
