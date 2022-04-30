import 'package:cbc_online/app_colors.dart';
import 'package:cbc_online/firebase/firebase_provider.dart';
import 'package:cbc_online/gen/assets.gen.dart';
import 'package:cbc_online/global_constants.dart';
import 'package:cbc_online/utils/buttons_decoration.dart';
import 'package:cbc_online/utils/show_dialogs.dart';
import 'package:cbc_online/utils/textform_decorator.dart';
import 'package:cbc_online/utils/validators.dart';
import 'package:cbc_online/viewmodels/sign_up_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool _isPasswordValid = context.watch<SignupViewmodel>().isPasswordValid;
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 0.0,
          elevation: 0.0,
          backgroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark)),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          showLoadingDialog(context);
                          context
                              .read<FirebaseProvider>()
                              .signInAnonymously(context)
                              .then((value) => {
                                    if (value)
                                      {
                                        Navigator.pop(context),
                                        Navigator.pushReplacementNamed(
                                            context, homepagePath)
                                      }
                                    else
                                      {Navigator.pop(context)}
                                  });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Skip, use app without an account",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      )),
                  const Text(
                    "Create an",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 124, 124, 124)),
                  ),
                  Text(
                    "Account",
                    style: TextStyle(
                        fontFamily: GoogleFonts.ultra().fontFamily,
                        //fontWeight: FontWeight.bold,
                        fontSize: 64,
                        color: Colors.black),
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
                    height: 32,
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
                              controller: _firstNameController,
                              validator: ((value) => firstNameValidator(value)),
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
                              controller: _lastNameController,
                              validator: (value) => lastNameValidator(value),
                              decoration:
                                  const TextFormDecorator(hintString: "Doe"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Your Email Address",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) => emailValidator(value),
                    decoration: const TextFormDecorator(
                        hintString: "yourname@email.com"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Set Password",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const TextFormDecorator(hintString: "********"),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  FlutterPwValidator(
                      numericCharCount: 1,
                      uppercaseCharCount: 1,
                      width: 400,
                      height: 85,
                      minLength: 6,
                      onSuccess: () {
                        context.read<SignupViewmodel>().validatePassword();
                      },
                      controller: _passwordController),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Confirm Password",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    validator: ((value) =>
                        confirmPassValidator(value, _passwordController.text)),
                    controller: _confirmPasswordController,
                    decoration: const TextFormDecorator(hintString: "********"),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: (() {
                      if (_formKey.currentState!.validate() &&
                          _isPasswordValid) {
                        showLoadingDialog(context);
                        context
                            .read<SignupViewmodel>()
                            .signup(
                                context: context,
                                email: _emailController.text,
                                password: _confirmPasswordController.text,
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text)
                            .then((value) => {
                                  if (value)
                                    {
                                      Navigator.pushReplacementNamed(
                                          context, homepagePath)
                                    }
                                  else
                                    {Navigator.pop(context)}
                                });
                      }
                    }),
                    child: Container(
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
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.white,
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
                          color: Colors.white,
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
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            color: Color.fromARGB(255, 124, 124, 124)),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Sign In",
                        style: TextStyle(color: appPrimaryColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
