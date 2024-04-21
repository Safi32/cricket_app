import 'package:cricket_app/Screens/auth_screen/signUp.dart';
import 'package:cricket_app/Screens/home_screen.dart';
import 'package:cricket_app/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class LogInScreen extends StatefulWidget {
  static const routeName = "logIn";
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';
  late bool _passwordVisible;

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();
      try {
        final UserCredential userCredential =
            await _firebase.signInWithEmailAndPassword(
                email: _enteredEmail, password: _enteredPassword);
        print(userCredential);
        Navigator.pushNamed(context, HomeScreen.routeName);
      } on FirebaseAuthException catch (e) {
        if (e.code == "Email or password wrong") {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.message ?? "Login Failed")));
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/Account circle.png",
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const Text(
                        "Sign in to continue",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: SizedBox(
                    width: 360,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.trim().isEmpty ||
                            !value.trim().contains("@")) {
                          return "Please enter a valid email address";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredEmail = value!;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: ImageIcon(
                          AssetImage(
                            "assets/Email.png",
                          ),
                          color: Colors.green,
                        ),
                        labelText: "Email",
                        floatingLabelStyle: TextStyle(color: primaryColor),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 360,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.trim().length < 4) {
                        return "Password must contain 4 characters";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredPassword = value!;
                    },
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: const ImageIcon(
                        AssetImage(
                          "assets/Lock.png",
                        ),
                        color: Colors.green,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        iconSize: 25,
                      ),
                      labelText: "Password",
                      floatingLabelStyle: TextStyle(color: primaryColor),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 360,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: _submit,
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have account?",
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      child: const Text(
                        "create a new account",
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ),
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
