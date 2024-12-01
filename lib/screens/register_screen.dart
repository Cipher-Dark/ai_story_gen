import 'package:ai_story_gen/screens/login_screen.dart';
import 'package:ai_story_gen/screens/story_input_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/flutter_auth_ui.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameEditiongController = TextEditingController();
  TextEditingController emailEditiongController = TextEditingController();
  TextEditingController passEditiongController = TextEditingController();
  TextEditingController passRepeatEditController = TextEditingController();
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    registeration() async {
      if (passRepeatEditController.text != "" &&
          nameEditiongController.text != "" &&
          emailEditiongController.text != "") {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailEditiongController.text,
                  password: passRepeatEditController.text);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
            "Regestrationi Successfully ",
            style: TextStyle(fontSize: 20),
          )));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StoryInputPage(
                        toggleTheme: () {
                          setState(() {
                            isDarkMode = !isDarkMode;
                          });
                        },
                        isDarkMode: isDarkMode,
                      )));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.orangeAccent,
                content: Text(
                  "Password is too weak",
                  style: TextStyle(fontSize: 20),
                )));
          } else if (e.code == "email-already-in-use") {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.orangeAccent,
                content: Text(
                  "Already accound exist",
                  style: TextStyle(fontSize: 20),
                )));
          } else if (e.code == "") {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.orangeAccent,
                content: Text(
                  "weak-password",
                  style: TextStyle(fontSize: 20),
                )));
          }
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Register"),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // const Text("Enter User Name"),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
                controller: nameEditiongController,
                decoration: const InputDecoration(
                  hintText: "Enter full name",
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // const Text("Enter Email"),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Email';
                  }
                  return null;
                },
                controller: emailEditiongController,
                decoration: const InputDecoration(
                  hintText: "Enter email",
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // const Text("Enter Password"),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Password';
                  }
                  return null;
                },
                controller: passEditiongController,
                decoration: const InputDecoration(
                  hintText: "Enter password",
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // const Text("Confirm password"),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  } else if (value != passEditiongController.text) {
                    return "Password does't match !!!";
                  }
                  return null;
                },
                controller: passRepeatEditController,
                decoration: const InputDecoration(
                    hintText: "Enter password again ",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.green,
                    ),
                    labelText: "Confirm Password"),
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  const SizedBox(height: 40),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        vertical: 13.0, horizontal: 30.0),
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have account!"),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text("Login"),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
