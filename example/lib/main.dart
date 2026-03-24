import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:simple_firebase/simple_firebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TestPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final email = "test123@gmail.com";
    final password = "123456";

    return Scaffold(
      appBar: AppBar(title: const Text("Auth Test")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// SIGN UP
            ElevatedButton(
              onPressed: () async {
                String res = await AuthHelper.signUp(
                  email: email,
                  password: password,
                );
                debugPrint(res);
              },
              child: const Text("Sign Up"),
            ),

            const SizedBox(height: 20),

            /// LOGIN
            ElevatedButton(
              onPressed: () async {
                String res = await AuthHelper.login(
                  email: email,
                  password: password,
                );
                debugPrint(res);
              },
              child: const Text("Login"),
            ),

            const SizedBox(height: 20),

            /// LOGOUT
            ElevatedButton(
              onPressed: () async {
                await AuthHelper.logout();
                debugPrint("Logged out");
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
