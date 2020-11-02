import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  List _schoolsName = [
    ' Střední škola služeb', ' SŠPHZ', ' MESIT střední škola', ' Gymnázium Uherské Hradiště', ' Soukromá střední škola', ' OAUH', ' Střední uměleckoprůmyslová škola',
  ];
  String _schoolsVal;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MATURITNÍ ČETBA'),
        centerTitle: true,
        backgroundColor: Colors.black,
        //backgroundColor: Colors.red[600],
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
                width: 300,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text('Knihy', style: TextStyle(color: Colors.white),),
                    color: Colors.grey[800],
                    //color: Colors.lightBlue,
                  ),
              ),
              SizedBox(height: 30.0),

              SizedBox(
                width: 300,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text('Deník', style: TextStyle(color: Colors.white),),
                    color: Colors.grey[800],
                    //color: Colors.lightBlue,
                  ),
              ),

              SizedBox(height: 30.0),

              SizedBox(
                height: 50,
                width: 300,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[800],
                    //color: Colors.lightBlue,
                  ),
                  child: DropdownButton(
                    underline: SizedBox(),
                    hint: Text(' Vyber školu', style: TextStyle(color: Colors.white),),
                    icon: Icon(Icons.arrow_circle_down, color: Colors.white,),
                    iconSize: 32,
                    value: _schoolsVal,
                      onChanged: (value) {
                        setState(() {
                          _schoolsVal = value;
                        });
                      },
                    items: _schoolsName.map((value){
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
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
