import 'package:flutter/material.dart';

class TitleHome extends StatelessWidget {
  TitleHome(
    this.startPlay_call, {
    super.key,
  });

  final VoidCallback startPlay_call;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/home.png'),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Lets Start the Quiz',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.black87,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: OutlinedButton(
              onPressed: startPlay_call,
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 5,
              ),
              child: const Text(
                'Play',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
