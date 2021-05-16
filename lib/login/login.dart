
import 'package:flutter/material.dart';
import 'package:projekt_prj/login/auth.dart';
import '../quote.dart';



class LoginPage extends StatefulWidget {

  final Function toggleView;
  LoginPage({this.toggleView});

  @override
  _LoginPageState createState() => _LoginPageState();
}

final _formKey = GlobalKey<FormState>();
final AuthenticationService _auth = AuthenticationService();

String email= "";
String password= "";
bool _ObscureText = true;

String error="Příhlášení";

class _LoginPageState extends State<LoginPage> {

  void passToggleView(){
    widget.toggleView();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
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
                    padding: const EdgeInsets.all(8.0),
                    child: new Image.asset('assets/images/log.png', width: size.width*0.6,),
                  ),
                  LoginBox(),
                  SizedBox(height: 10.0),
                  LoginButton(),
                  SizedBox(height: 15.0),
                  RegisterButton(toggleView: passToggleView),
                  SizedBox(height: 15.0,),
                  //ForgotPass(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginBox extends  StatefulWidget{
  @override
  _LoginBoxState createState() => _LoginBoxState();
}
class _LoginBoxState extends State<LoginBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextFormField(
                validator: (val) => val.isEmpty ? 'Vložte e-mail' : null,
                onChanged: (val){
                  setState(()=>email=val);
                },
                obscureText: false,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextFormField(
                validator: (val) => val.length <6 ? 'Vložte heslo o 6 nebo více znacích' : null,
                onChanged: (val){
                  setState(()=>password=val);
                },
                obscureText: _ObscureText,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.blue,
                  ),
                  //suffixIcon: Icon(Icons.visibility, color: Colors.blue,),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _ObscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        _ObscureText = !_ObscureText;
                      });
                    },
                  ),
                  /*suffixIcon: Icon(
                    Icons.visibility,
                    color: Colors.blue,
                  ),*/
                  border: OutlineInputBorder(),
                  labelText: 'Heslo',
                ),
              ),
            )
          ],
        )
    );
  }
}

class LoginButton extends StatefulWidget{
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: size.width*0.8,
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(350.0)),
              onPressed: () async{
                if(_formKey.currentState.validate())
                {
                  dynamic result = await _auth.signIn(email, password);
                  if(result == null){
                    setState(() => error='Nesprávný e-mail nebo heslo');
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
                child: Center(child: const Text('Přihlásit se', textAlign: TextAlign.center, style: TextStyle(fontSize: 22))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterButton extends StatefulWidget {

  final Function toggleView;
  RegisterButton({this.toggleView});

  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: size.width*0.8,
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
              onPressed: () {
                widget.toggleView();
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
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
            ),
          ),
        ],
      ),
    );
  }
}
/*
class ForgotPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: null,
          child: Text(
            "Zapomenuté heslo",
            style: TextStyle(color: Colors.blue, fontSize: 16.0),
          ),
        ),
      ],
    );
  }
}
*/