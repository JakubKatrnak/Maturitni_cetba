import 'package:flutter/material.dart';
import 'package:projekt_prj/login/finish.dart';

import '../quote.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            title: Text('Registrace'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: ClipPath(
              clipper: MyCustomClipperForAppBar(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: new Image.asset('assets/images/register.png', width: size.width*0.8,),
                ),
                Name(),
                Surname(),
                Mail(),
                Password(),
                CheckPassword(),
                SizedBox(height: 10.0),
                RegisterBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: TextField(
        obscureText: false,
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: Colors.blue,
          ),
          border: OutlineInputBorder(),
          labelText: 'Jméno',
        ),
      ),
    );
  }
}

class Surname extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: TextField(
        obscureText: false,
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: Colors.blue,
          ),
          border: OutlineInputBorder(),
          labelText: 'Příjmení',
        ),
      ),
    );
  }
}

class Mail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: TextField(
        obscureText: false,
        decoration: InputDecoration(
          icon: Icon(
            Icons.mail,
            color: Colors.blue,
          ),
          border: OutlineInputBorder(),
          labelText: 'E-mail',
        ),
      ),
    );
  }
}

class Password extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: Colors.blue,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.blue,
          ),
          border: OutlineInputBorder(),
          labelText: 'Heslo',
        ),
      ),
    );
  }
}

class CheckPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: Colors.blue,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.blue,
          ),
          border: OutlineInputBorder(),
          labelText: 'Potvrdit heslo',
        ),
      ),
    );
  }
}

class RegisterBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(350.0)),
      onPressed: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FinishRegistration()),
        );
      },
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: size.width*0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF0D47A1),
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
            ],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Center(child: const Text('Registrovat se', textAlign: TextAlign.center, style: TextStyle(fontSize: 22))),
      ),
    );
  }
}






