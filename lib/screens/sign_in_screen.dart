import 'package:flutter/material.dart';
import '../utils/authentication.dart';
import '../widgets/google_sign_in_button.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C384A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/firebase_logo.png',
                        height: 760,
                        width: 470,
                      ),
                    
                    ),
              Row(),
              Text(
                'FlutterFire',
                style: TextStyle(
                    color: Color.fromARGB(255, 201, 177, 59).withOpacity(0.8),
                    fontSize: 26,
                    letterSpacing: 0.2),
              ),
              Text(
                'Authentication',
                style: TextStyle(
                    color: Color.fromARGB(255, 160, 137, 25).withOpacity(0.8),
                    fontSize: 26,
                    letterSpacing: 0.2),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.orange,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}