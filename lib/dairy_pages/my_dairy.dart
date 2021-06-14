import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projekt_prj/dairy_pages/dairy.dart';
import 'package:projekt_prj/dairy_pages/edit_dairy.dart';
import 'package:projekt_prj/login/models/user.dart';
import 'package:provider/provider.dart';

import '../database.dart';
import '../quote.dart';

class Comments extends StatefulWidget {

  final String diaryId;

  const Comments({Key key, this.diaryId}) : super(key: key);

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {

    GetUser user = Provider.of<GetUser>(context);

    Query diaryRef = FirebaseDatabase.instance.reference()
        .child("deniky")
        .child(user.uid)
        .orderByKey()
        .equalTo(widget.diaryId);

    String error = "Kniha";
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          title: Text(error),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () async{
                showDialog(
                  context: context,
                  builder:(_) => AlertDialog(
                    title: Text("Chystáte se smazat knihu!"),
                    content: Text("Kniha již nepůjde navráti"),
                    actions: [
                      FlatButton(onPressed: () async{
                        dynamic result = await DatabaseService(uid: user.uid).deleteDiary(widget.diaryId);
                        if(result == null) {
                          setState(() => error='Smazání se nezdařilo');
                        }
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Dairy()),
                        );
                      }, child: Text("smazat"))
                    ],
                  ),
                  barrierDismissible: true,
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
            image: AssetImage('assets/images/background_note.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: FirebaseAnimatedList(
          query: diaryRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double>animation, int){
            Map diary = snapshot.value;
            return _buildDiary(diary: diary);
          },
        ),
      ),
    );
  }

  Widget _buildDiary({Map diary}){

    String bookId= widget.diaryId;
    String book= diary['book'];
    String author= diary['author'];
    String genre= diary['genre'];
    String notes= diary['notes'];


    Size size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 120.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                child: new Image.asset('assets/images/reading.png', width: 0.8,),
              ),
              Row(
                children: [
                  Text(
                    'Kniha: ',
                    style: Theme.of(context).textTheme.headline4,
                  ),

                ],
              ),
              Row(
                children: [
                  Flexible(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(book, style: Theme.of(context).textTheme.headline5,),
                  )),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Autor: ',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
              Row(
                children: [
                    Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(author, style: Theme.of(context).textTheme.headline5,),
                        ),
                    ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Žánr: ',
                    style: Theme.of(context).textTheme.headline4,
                  ),

                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(genre, style: Theme.of(context).textTheme.headline5,),
                    ),
                  ),
                ],
              ),
              Align(

                alignment: Alignment.centerLeft,
                child: Text(
                  'Poznámky: ',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Text(notes, style: TextStyle(fontSize: 18),),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Upravit(book: book, author: author, genre: genre, notes: notes, bookId: bookId),
                ),
              ),
            ],
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

class Upravit extends StatefulWidget {

  final String book;
  final String author;
  final String genre;
  final String notes;
  final String bookId;

  const Upravit({Key key, this.book, this.author, this.genre, this.notes, this.bookId}) : super(key: key);


  @override
  _UpravitState createState() => _UpravitState();
}

class _UpravitState extends State<Upravit> {
  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: size.width*0.4,
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150.0)),
              onPressed: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => EditComments(book: widget.book, author: widget.author, genre: widget.genre, notes: widget.notes, bookId: widget.bookId)),
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
                child: Center(
                    child: const Text('Upravit', textAlign: TextAlign.center, style: TextStyle(fontSize: 22))
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

