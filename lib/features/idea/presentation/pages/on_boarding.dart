import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child:Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Good Bye", 
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                "Book & Pen",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Image(
                image: AssetImage("assets/images/onboarding.png"),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Miker, Instead!",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                "Catat idemu kapanpun dimanapun",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                }, 
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Mulai Mencatat!",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}