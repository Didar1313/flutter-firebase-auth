import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ProfileScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static Future<User?> _loginEmailAndPassword(
      {required String email,
        required String password,
        required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No user found for that email")),
        );
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Wrong password provided")),
        );
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailEditingController = TextEditingController();
    TextEditingController passwordEditingController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Data Read from Firebase",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.green, fontSize: 30),
          ),
        ),
        backgroundColor: CupertinoColors.systemYellow,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Login System",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 40,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: emailEditingController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Enter your email",
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: passwordEditingController,
            obscureText: true, // Ensure password field is hidden
            decoration: const InputDecoration(
              hintText: "Enter your password",
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.cyan,
              elevation: 0.0,
              onPressed: () async {
                User? user = await _loginEmailAndPassword(
                  email: emailEditingController.text,
                  password: passwordEditingController.text,
                  context: context,
                );
                if (user != null) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()),
                  );
                }
              },
              child: const Text(
                "Login",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 30),
              ),
            ),
          )
        ],
      ),
    );
  }
}
