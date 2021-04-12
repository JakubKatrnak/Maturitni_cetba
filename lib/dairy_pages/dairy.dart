import 'package:flutter/material.dart';
import 'package:projekt_prj/dairy_pages/my_dairy.dart';
import 'package:projekt_prj/dairy_pages/new_dairy.dart';
import 'package:projekt_prj/quote.dart';

class Dairy extends StatefulWidget {
  @override
  _DairyState createState() => _DairyState();
}

class _DairyState extends State<Dairy> {
  @override
  Widget build(BuildContext context) {
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
        child: ListView(
          children: <Widget>[
            Comment(),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewComments()),
          );
        },
        tooltip: 'Increment',
        backgroundColor: Color(0xFF1976D2),
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}

class Comment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF1976D2),
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Comments()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: 350,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Nový deník',
                            style: Theme.of(context).textTheme.headline3,
                          )
                      ),
                    ],
                  )
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*class Dairy extends StatefulWidget {
  @override
  _DairyState createState() => _DairyState();
}

class _DairyState extends State<Dairy> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;

    });
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 120.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                  child: new Image.asset('assets/images/comments.png', width: size.width*0.8,),
                ),
                Container(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(350.0)),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Comments()),
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
                      child: Center(child: Text('Deník ' + '$_counter', textAlign: TextAlign.center, style: TextStyle(fontSize: 20))),
                    ),
                  ),
                ),
                //DairyButton(),
              ],


            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Color(0xFF1976D2),
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}

class DairyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(350.0)),
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Comments()),
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
          child: Center(child: const Text('Deník', textAlign: TextAlign.center, style: TextStyle(fontSize: 20))),
        ),
      ),
    );
  }
}
*/
