import 'package:flutter/material.dart';
import 'package:screens_movie_stream/core/constants/contants.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const HomeButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColors.red,
        foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
