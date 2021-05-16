import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:projekt_prj/dairy_pages/my_dairy.dart';
import 'package:projekt_prj/dairy_pages/new_dairy.dart';
import 'package:projekt_prj/library_pages/home.dart';
import 'package:projekt_prj/login/models/user.dart';
import 'package:projekt_prj/quote.dart';
import 'package:provider/provider.dart';


class Dairy extends StatefulWidget {
  @override
  _DairyState createState() => _DairyState();
}


class _DairyState extends State<Dairy> {
  @override
  Widget build(BuildContext context) {

    GetUser user = Provider.of<GetUser>(context);
    Query getDiaries = FirebaseDatabase.instance.reference().child("deniky").child(user.uid).orderByKey();

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () async{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image_4.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: <Widget>[
            FirebaseAnimatedList(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                query: getDiaries,
                itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double>animation, int) {
                  Map diaries = snapshot.value;
                  String bookId = snapshot.key;
                  return _buildDiaries(diaries: diaries,bookId: bookId);
                }
            ),
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

  Widget _buildDiaries({Map diaries, String bookId}) {
    return Card(
      color: Color(0xFF1976D2),
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Comments(diaryId: bookId)),
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
                          child: Text(diaries['book'], style: Theme.of(context).textTheme.headline3,)
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
