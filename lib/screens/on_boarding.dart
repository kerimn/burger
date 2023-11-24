import 'package:burger/constants/images.dart';
import 'package:burger/screens/my_app.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              color: const Color.fromRGBO(4, 176, 53, 1),
              child: Center(
                child: Image.asset(
                  AppImages.onBoardingImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      "Olymp Club Delivery - Where \n  Excellence is Delivered! 🌍✨",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge),
                  Text(
                    "Ready to elevate your delivery experience? Join \n Olymp Club Delivery today and let us redefine convenience and luxury just for you",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.grey),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(296, 24)),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                      ),
                      shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyAppPage()),
                      );
                    },
                    child: Text('Let`s start'.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white)),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text:
                              'By clicking to the “Continue” button, you agree to our ',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms of use',
                          style: const TextStyle(
                            color: Color.fromRGBO(4, 176, 53, 1),
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        const TextSpan(
                          text: ' and ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: const TextStyle(
                            color: Color.fromRGBO(4, 176, 53, 1),
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        TextSpan(
                          text: '\n Restore',
                          style: const TextStyle(
                            color: Color.fromRGBO(4, 176, 53, 1),
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
