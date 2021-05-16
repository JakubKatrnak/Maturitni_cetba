
import 'package:flutter/material.dart';
import 'package:projekt_prj/login/auth.dart';
import '../quote.dart';

class Registration extends StatefulWidget {

  final Function toggleView;
  Registration({this.toggleView});

  @override
  _RegistrationState createState() => _RegistrationState();
}

final _formKey = GlobalKey<FormState>();
final AuthenticationService _auth = AuthenticationService();

String email= "";
String password= "";
String name= "";
String surname= "";

String error="Registrace";


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
          leading: IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            onPressed: (){
              widget.toggleView();
            },
          ),
          title: Text(error),
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
        child: Form(
          key: _formKey,
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
      ),
    );
  }
}

class Name extends StatefulWidget {
  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: TextFormField(
        validator: (val) => val.isEmpty ? 'Vložte jméno' : null,
        onChanged: (val){
          setState(()=>name=val);
        },
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

class Surname extends StatefulWidget {
  @override
  _SurnameState createState() => _SurnameState();
}

class _SurnameState extends State<Surname> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: TextFormField(
        validator: (val) => val.isEmpty ? 'Vložte přijmení' : null,
        onChanged: (val){
          setState(()=>surname=val);
        },
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

class Mail extends StatefulWidget {
  @override
  _MailState createState() => _MailState();
}

class _MailState extends State<Mail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: TextFormField(
        validator: (val) => val.isEmpty ? 'Vložte e-mail' : null,
        onChanged: (val){
          setState(()=>email=val);
        },
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

class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: TextFormField(
        validator: (val) => val.length <6 ? 'Vložte heslo o 6 nebo více znacích' : null,
        onChanged: (val){
          setState(()=>password=val);
        },
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

class CheckPassword extends StatefulWidget {
  @override
  _CheckPasswordState createState() => _CheckPasswordState();
}

class _CheckPasswordState extends State<CheckPassword> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: TextFormField(
        validator: (val){
          if (val != password){
            return 'hesla se neshodují';
          }
          return null;
        },
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

class RegisterBtn extends StatefulWidget {
  @override
  _RegisterBtnState createState() => _RegisterBtnState();
}

class _RegisterBtnState extends State<RegisterBtn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(350.0)),
      onPressed: () async {
        if(_formKey.currentState.validate())
        {
          dynamic result = await _auth.signUp(email, password, name, surname);
          if(result == null){
            setState(() => error='Something is wrong I can feel it');
          }
        }
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





