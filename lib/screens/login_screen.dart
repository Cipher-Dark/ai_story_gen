import 'package:ai_story_gen/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userEditingController = TextEditingController();
    TextEditingController passwordEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              const Text("Login Page"),
              const SizedBox(height: 10),
              TextField(
                controller: userEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'User Name',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordEditingController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Password'),
              ),
              const SizedBox(height: 20),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.close,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account ?"),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text("Register"),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
