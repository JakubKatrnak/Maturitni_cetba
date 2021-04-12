import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projekt_prj/dairy_pages/dairy.dart';

import '../quote.dart';

class NewComments extends StatefulWidget {
  @override
  _NewCommentsState createState() => _NewCommentsState();
}

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
          title: Text('Deník'),
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
    );
  }
}

class Kniha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: TextField(
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

class Autor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: TextField(
        obscureText: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Autor'
        ),
      ),
    );
  }
}

class Druh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: TextField(
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

class Poznamky extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: TextField(
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

class Ulozit extends StatelessWidget {
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
              onPressed: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Dairy()),
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
                child: Center(child: const Text('Uložit', textAlign: TextAlign.center, style: TextStyle(fontSize: 22))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
