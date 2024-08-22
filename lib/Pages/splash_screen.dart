import 'package:dog_api_project/Pages/login_singup.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToHomePage();
  }

  goToHomePage() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LogInSignUp(),
            ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Image.network(
                "https://media.istockphoto.com/id/1180800216/vector/cute-cartoon-sleeping-dog.jpg?s=612x612&w=0&k=20&c=PwZ34wb3uFzgsASPEEz77kvj7s_-9oGIX1vIoRrjkdg="),
          ),
          // const Text("PetKart")
        ],
      ),
    );
  }
}
