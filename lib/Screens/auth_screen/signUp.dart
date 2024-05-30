import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_app/Screens/auth_screen/login.dart';
import 'package:cricket_app/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final _firebase = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {
  static const routeName = "signUp";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredPhone = '';
  var _enteredUsername = '';
  String imageUrl = '';

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (imageUrl.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please Upload an image"),
        ),
      );
    }
    if (isValid) {
      _formKey.currentState!.save();
      try {
        final UserCredential = await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
        final String userId = UserCredential.user!.uid;
        print(UserCredential);

        await FirebaseFirestore.instance
            .collection('acoounts')
            .doc(userId)
            .set({
          'UserId': userId,
          'username': _enteredUsername,
          'email': _enteredEmail,
          'phone': _enteredPhone,
          'password': _enteredPassword,
          'photoUrl': imageUrl,
        });

        Navigator.pushNamed(context, LogInScreen.routeName);
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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const Text(
                      "Create a new account",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage("assets/Account circle.png"),
                        ),
                        Positioned(
                          bottom: -10,
                          left: 80,
                          child: IconButton(
                            onPressed: () async {
                              final imagePicker = ImagePicker();
                              XFile? file = await imagePicker.pickImage(
                                  source: ImageSource.camera);
                              print('${file?.path}');
                              if (file == null) return;
                              String uniqueFileName = DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString();
                              Reference referenceRoot =
                                  FirebaseStorage.instance.ref();
                              Reference referenceDirImages =
                                  referenceRoot.child('images');
                              Reference referenceImageToUpload =
                                  referenceDirImages.child(uniqueFileName);
                              try {
                                await referenceImageToUpload
                                    .putFile(File(file.path));
                                imageUrl = await referenceImageToUpload
                                    .getDownloadURL();
                              } catch (e) {}
                            },
                            icon: const Icon(Icons.camera_alt),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 370,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.trim().isEmpty ||
                                  value.trim().length < 4) {
                                return "Username must contains more than 4 characters";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredUsername = value!;
                            },
                            decoration: const InputDecoration(
                              prefixIcon: ImageIcon(
                                AssetImage(
                                  "assets/User.png",
                                ),
                                color: primaryColor,
                              ),
                              prefixIconColor: Colors.grey,
                              labelText: "Username",
                              floatingLabelStyle:
                                  TextStyle(color: primaryColor),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 370,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.trim().isEmpty ||
                              !value.contains("@") ||
                              !value.contains(".com")) {
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredEmail = value!;
                        },
                        decoration: const InputDecoration(
                          labelText: "Email",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: ImageIcon(
                            AssetImage(
                              "assets/Email.png",
                            ),
                            color: primaryColor,
                          ),
                          prefixIconColor: Colors.grey,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 370,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.trim().length != 11) {
                            return "Phone number must be eleven digits";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredPhone = value!;
                        },
                        decoration: const InputDecoration(
                          labelText: "Phone",
                          floatingLabelStyle: TextStyle(
                            color: primaryColor,
                          ),
                          prefixIcon: ImageIcon(
                            AssetImage(
                              "assets/Local phone.png",
                            ),
                            color: primaryColor,
                          ),
                          prefixIconColor: Colors.grey,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 370,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value.trim().length < 4) {
                            return "Password must be more than 4 characters";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredPassword = value!;
                        },
                        onChanged: (value) {
                          _enteredPassword = value;
                        },
                        decoration: const InputDecoration(
                          labelText: "Password",
                          floatingLabelStyle: TextStyle(
                            color: primaryColor,
                          ),
                          prefixIcon: ImageIcon(
                            AssetImage(
                              "assets/Lock.png",
                            ),
                            color: primaryColor,
                          ),
                          prefixIconColor: Colors.grey,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.grey,
                          )),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 370,
                      child: TextFormField(
                        validator: (value) {
                          if (_enteredPassword != value) {
                            return "Password do not match";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: "Confirm Password",
                          floatingLabelStyle: TextStyle(color: primaryColor),
                          prefixIcon: ImageIcon(
                            AssetImage(
                              "assets/Lock.png",
                            ),
                            color: primaryColor,
                          ),
                          prefixIconColor: Colors.grey,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
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
                    Container(
                      width: 370,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xFF68B787),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: _submit,
                          child: Text(
                            "CREATE ACCOUNT",
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
                          "Already have account? ",
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, LogInScreen.routeName);
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Color(0xFF68B787),
                              fontWeight: FontWeight.bold,
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
        ),
      ),
    );
  }
}
