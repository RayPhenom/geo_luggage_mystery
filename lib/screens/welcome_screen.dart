import 'package:flutter/material.dart';
import 'package:geo_luggage_mystery/screens/signin_screen.dart';
import 'package:geo_luggage_mystery/screens/signup_screen.dart';
import 'package:geo_luggage_mystery/widgets/custom_scaffold.dart';
import 'package:geo_luggage_mystery/widgets/welcome_button.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
            flex: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
            child: Center(
              child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome to Geo-Luggage\n',
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                  TextSpan(
                    text: '\n Enter your details to access Geo-luggage Mystery account',
                    style: TextStyle(
                      fontSize: 20,
                    )
                  )
                ],
              ),
            ),
            ),
          )),
          const Flexible(
            flex: 1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    Expanded(
                      child:
                        WelcomeButton(
                          buttonText: 'Sign in',
                          onTap: SignInScreen(),
                          color: Colors.transparent,
                          textColor: Colors.white,
                        ),
                    ),
                    Expanded(
                      child:
                      WelcomeButton(
                        buttonText: 'Sign up',
                        onTap: SignupScreen(),
                        color: Colors.white ,
                        textColor: Colors.black ,
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
