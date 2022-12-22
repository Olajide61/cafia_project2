import 'package:cafia_project2/screens/auths/setup_profile.dart';
import 'package:cafia_project2/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/loginimage.png'),
              fit: BoxFit.fill),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 300,
              width: 250,
            ),
            const SizedBox(
              height: 52,
            ),
            Text(
              'Share with your\n friends ',
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                textStyle: const TextStyle(
                    fontSize: 37,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Do you mind inviting a couple of your\n friends to this great app? \n You’ll own a fraction of the app for that.',
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400)),
            ),
            const SizedBox(
              height: 104,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const SetupProfile();
                    }),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.pink),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
