import 'package:projekt_prj/login/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projekt_prj/dairy_pages/dairy.dart';
import 'package:projekt_prj/database.dart';
import 'package:provider/provider.dart';

import '../quote.dart';

class NewComments extends StatefulWidget {
  @override
  _NewCommentsState createState() => _NewCommentsState();
}


final _formKey = GlobalKey<FormState>();

String book= "";
String author= "";
String genre= "";
String notes= "";

String error="Nový deník";

class _NewCommentsState extends State<NewComments> {
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 120.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                      child: new Image.asset('assets/images/writing.png', width: size.width*0.8,),
                    ),
                    Kniha(),
                    Autor(),
                    Druh(),
                    Poznamky(),
                    Ulozit(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Kniha extends StatefulWidget {
  @override
  _KnihaState createState() => _KnihaState();
}

class _KnihaState extends State<Kniha> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: TextFormField(
        validator: (val) => val.isEmpty ? 'Vložte název knihy' : null,
        onChanged: (val){
          setState(()=>book=val);
        },
        //enabled: true,
        obscureText: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Kniha'
        ),
      ),
    );
  }
}

class Autor extends StatefulWidget {
  @override
  _AutorState createState() => _AutorState();
}

class _AutorState extends State<Autor> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: TextFormField(
        validator: (val) => val.isEmpty ? 'Vložte jméno autora' : null,
        onChanged: (val){
          setState(()=>author=val);
        },
        obscureText: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Autor'
        ),
      ),
    );
  }
}

class Druh extends StatefulWidget {
  @override
  _DruhState createState() => _DruhState();
}

class _DruhState extends State<Druh> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: TextFormField(
        validator: (val) => val.isEmpty ? 'Vložte žánr knihy' : null,
        onChanged: (val){
          setState(()=>genre=val);
        },
        obscureText: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Druh'
        ),
      ),
    );
  }
}

/*class Poznamky extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        height: size.height*0.5,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blueAccent,
            width: 5.0,
          ),
        ),
        child: Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Poznámky'
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/

class Poznamky extends StatefulWidget {
  @override
  _PoznamkyState createState() => _PoznamkyState();
}

class _PoznamkyState extends State<Poznamky> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: TextFormField(
        onChanged: (val){
          setState(()=>notes=val);
        },
        maxLines: null,
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Poznámky',
        ),
      ),
    );
  }
}

class Ulozit extends StatefulWidget {
  @override
  _UlozitState createState() => _UlozitState();
}

class _UlozitState extends State<Ulozit> {
  @override
  Widget build(BuildContext context) {

    GetUser user = Provider.of<GetUser>(context);

    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: size.width*0.8,
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(350.0)),
              onPressed: () async {
                if(_formKey.currentState.validate())
                {
                  dynamic result = await DatabaseService(uid: user.uid).addDiary(book, author, genre, notes);
                  if(result == null){
                    setState(() => error='Přidání se nezdařilo');
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Dairy()),
                  );
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
                child: Center(child: const Text('Uložit', textAlign: TextAlign.center, style: TextStyle(fontSize: 22))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
