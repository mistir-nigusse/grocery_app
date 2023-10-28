import 'package:flutter/material.dart';

class  SignIn_Container extends StatelessWidget {
  final child;
  const SignIn_Container({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Image.asset('assets/Signin.png'),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.9,
            bottom: 0, 
            left: 0, 
            right: 0, 
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: child,
            ),
          ),
        ],
      ),
    )));
  }
}
