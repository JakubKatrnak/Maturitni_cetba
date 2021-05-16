import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projekt_prj/library_pages/home.dart';
import 'package:provider/provider.dart';
import 'login/auth.dart';
import 'login/login.dart';
import 'login/models/user.dart';
import 'login/registration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<GetUser>.value(
      value: AuthenticationService().user,
      child: MaterialApp(
        title: 'Maturitní četba',
        theme: ThemeData(
          fontFamily: 'Georgia',
          textTheme: TextTheme(
            headline3: TextStyle(color: Colors.white),
            headline4: TextStyle(color: Colors.black)
          )
        ),
        debugShowCheckedModeBanner: false,
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {

  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {


    final user = Provider.of<GetUser>(context);

    if (user != null) {
      return Home();
    }
    if(showSignIn){
      return LoginPage(toggleView: toggleView);
    } else {
      return Registration(toggleView: toggleView);
    }
  }
}



