import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.text});

  final VoidCallback onPressed;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon, // Replace with your Google icon image path
            height: 24.0,
          ),
          const SizedBox(width: 12.0),
          Text(
            text,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
