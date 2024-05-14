import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:signin/screens/sign_in_screen.dart';
import '../utils/authentication.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late User _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        actions: [
          IconButton(
            onPressed: () async {
              setState(() {
                _isSigningOut = true;
              });
              await Authentication.signOut(context: context);
              setState(() {
                _isSigningOut = false;
              });
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(), // <-- Remove the extra semicolon here
            _user.photoURL != null
                ? ClipOval(
                    child: Material(
                      color: Color.fromARGB(255, 67, 93, 110).withOpacity(0.3),
                      child: Image.network(
                        _user.photoURL!,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  )
                : SizedBox(), // <-- Added a SizedBox to replace the Row()
            Text('User Info Screen'),
            SizedBox(height: 16),
            Text('Name: ${widget._user.displayName ?? 'N/A'}'),
            SizedBox(height: 8),
            Text('Email: ${widget._user.email ?? 'N/A'}'),
            Text('You are now signed in using your Google account. To sign out of your account click the "Sign Out" button below.',
                style: TextStyle(
                    color: Color(0xFFECEFF1).withOpacity(0.8),
                    fontSize: 14,
                    letterSpacing: 0.2),
              ),
              ElevatedButton(
              onPressed: () async {
                setState(() {
                  _isSigningOut = true;
                });
                await FirebaseAuth.instance.signOut(); // Sign out the user
                setState(() {
                  _isSigningOut = false;
                });
                Navigator.pushReplacement( // Navigate back to the sign-in screen
                  context,
                  _routeToSignInScreen(),
                );
              },
              child: _isSigningOut ? CircularProgressIndicator() : Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
