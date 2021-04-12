import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projekt_prj/dairy_pages/dairy.dart';
import 'package:projekt_prj/login/login.dart';
import 'package:projekt_prj/quote.dart';
import 'package:projekt_prj/setting.dart';
import 'library.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {



  List _schoolsName = [
    /*' Střední škola služeb', ' SŠPHZ', ' MESIT střední škola', ' Gymnázium Uherské Hradiště', ' Soukromá střední škola',*/ ' OAUH',/* ' SUPSUH',*/
  ];

  String _schoolsVal;
  double x = 300.0;
  double y = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
          ),
          title: Text('MATURITNÍ ČETBA'),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingPage()),
                  );
                },
            )
          ],
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
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/image_2.jpg'),
              fit: BoxFit.cover,
            ),
          ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: x,
                height: y,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BooksList()),
                      );
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: x,
                      height: y,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text('Knihy',
                        style: TextStyle(fontSize: 17),
                    ),
                      ),
                  ),
                  ),
                ),
              //),
              SizedBox(height: 30.0),

              SizedBox(
                width: x,
                height: y,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dairy()),
                    );
                  },
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: x,
                    height: y,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text('Deník',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ),
              //),
              SizedBox(height: 30.0),

              SizedBox(
                height: y,
                width: x,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                    //color: Colors.lightBlue,
                  ),
                  child: Center(
                    child: DropdownButton(
                      // style: TextStyle(color: Colors.white),
                      hint: Text(' Vyber školu ',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(Icons.arrow_circle_down, color: Colors.white,),
                      iconSize: 24,
                      value: _schoolsVal,
                      onChanged: (value) {
                        setState(() {
                          _schoolsVal = value;
                        });
                      },
                      items: _schoolsName.map((value){
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18.0),
            ],
          ),
        ),
      ),
    );
  }
}
