import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projekt_prj/login/models/user.dart';
import 'package:provider/provider.dart';
import '../database.dart';
import '../quote.dart';

class Book extends StatefulWidget
{

  final String bookName;
  final String bookId;
  final String bookAuthor;
  final String bookGenre;

  const Book({Key key, this.bookId, this.bookName, this.bookAuthor, this.bookGenre}) : super(key: key);

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {

  Query bookRef;
  void getBook()
  {
    bookRef = FirebaseDatabase.instance.reference()
        .child("oauh_knihy")
        .orderByKey()
        .equalTo(widget.bookId);
  }

  @override
  Widget build(BuildContext context) {

    GetUser user = Provider.of<GetUser>(context);

    getBook();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          title: Text(widget.bookName),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.post_add_outlined,
                color: Colors.white,
              ),
              onPressed: () async{
                dynamic result = await DatabaseService(uid: user.uid).addDiary(widget.bookName, widget.bookAuthor, widget.bookGenre,"");
                if(result == null){
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Kniha byla přidána do deníku!"),
                    ),
                    barrierDismissible: true,
                  );
                }
                else{
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("přidání se nepodařilo"),
                    ),
                    barrierDismissible: true,
                  );
                }
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
        child: FirebaseAnimatedList(
          query: bookRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double>animation, int){
            Map kniha = snapshot.value;
            return _buildBookItem(kniha: kniha);
          },
        ),
      ),
    );
  }

  Widget _buildBookItem({Map kniha}){
    double cWidth = MediaQuery.of(context).size.width*0.8;
    return Container(
      constraints: BoxConstraints(
        minHeight: 900,
        minWidth: 400,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_book.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Image.network(kniha['prebal'],
                      height: 300,
                      width: 170,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Autor:',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          kniha['autor'],
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          'Žánr:',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          kniha['zanr'],
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          'Rok vydání:',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          kniha['rok_vydani'],
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          'Počet stran:',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          kniha['pocet_stran'],
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          'ISBN:',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          kniha['isbn'],
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: cWidth,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Popis:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Text(
                      kniha['popis'],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16.0
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
