import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login to your account',
              style: GoogleFonts.getFont(
                'Lato',
                color: Color(0xFF0d120E),
                fontWeight: FontWeight.bold,
                letterSpacing: 0.2,
                fontSize: 23,
              ),
            ),
            Text(
              'Explore world exclusives',
              style: GoogleFonts.getFont(
                'Lato',
                color: Color(0xFF0d120E),
                fontSize: 14,
                letterSpacing: 0.2,
              ),
            ),
            Image.asset(
              'assets/images/Illustration.png',
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
