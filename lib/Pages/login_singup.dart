import 'package:dog_api_project/Pages/navigation_page.dart';
import 'package:flutter/material.dart';

class LogInSignUp extends StatefulWidget {
  const LogInSignUp({super.key});

  @override
  State<LogInSignUp> createState() => _LogInState();
}

class _LogInState extends State<LogInSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 270.0),
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                child: const Icon(
                  Icons.pets_sharp,
                  size: 60,
                ),
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Text(
                "Millions of Pets.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              )),
          const Text(
            "Forever Best..",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationPage()));
            },
            child: const Text(
              "Continue",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
