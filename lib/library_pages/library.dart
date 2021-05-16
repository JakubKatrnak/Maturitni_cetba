import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projekt_prj/library_pages/home.dart';
import 'package:projekt_prj/quote.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:projekt_prj/library_pages/book.dart';


class BooksList extends StatefulWidget {

  @override
  _BooksListState createState() => _BooksListState();
}


Query dbRef = FirebaseDatabase.instance.reference().child("oauh_knihy").orderByKey();


void changeObdobi()
{
  dbRef = FirebaseDatabase.instance.reference()
      .child("oauh_knihy")
      .orderByChild("id_obdobi")
      .equalTo(getObdobi);

}

List obdobi = [
  'Světová a česká 18. století',
  'Světová a česká 19. století',
  'Světová 20. a 21. století',
  'Česká 20. a 21. století',
];
String obdobiVal;
String getObdobi;

class _BooksListState extends State<BooksList> {


  Widget _buildBookItem({Map knihy}){
    return Card(
      color: Color(0xFF1976D2),
      margin: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0),
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Book(bookId: knihy['id_knihy'], bookName: knihy['nazev_knihy'], bookAuthor: knihy['autor'], bookGenre: knihy['zanr'])),
          );
        },

        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: 350,
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      child: Image.network(knihy['prebal'],
                        height: 160.0,
                        width: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0,),
                  Expanded(
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              knihy['nazev_knihy'] + ' ',
                              style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 6.0),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              ' autor: ' +  knihy['autor'],
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 6.0),
                        ],
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text('Knihy'),
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
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
                  width: 300,
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
                        hint: Text('Období',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: Icon(Icons.arrow_circle_down, color: Colors.white,),
                        iconSize: 24,
                        value: obdobiVal,
                        onChanged: (value) {

                          setState(() {
                            obdobiVal = value;
                          });
                          if(obdobiVal == "Světová a česká 18. století") {getObdobi = "1"; changeObdobi(); Future.delayed(const Duration(milliseconds: 5000)); Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BooksList()));}
                          else if(obdobiVal == "Světová a česká 19. století"){getObdobi = "2"; changeObdobi(); Future.delayed(const Duration(milliseconds: 5000)); Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BooksList()));}
                          else if(obdobiVal == "Světová 20. a 21. století"){getObdobi = "3"; changeObdobi(); Future.delayed(const Duration(milliseconds: 5000)); Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BooksList()));}
                          else if(obdobiVal == "Česká 20. a 21. století"){getObdobi = "4"; changeObdobi(); Future.delayed(const Duration(milliseconds: 5000)); Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BooksList()));}
                        },
                        items: obdobi.map((value){
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
              ],
            ),
            FirebaseAnimatedList(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                query: dbRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double>animation, int){
                  Map knihy = snapshot.value;
                  return _buildBookItem(knihy: knihy);
                }
            )
          ],
        ),
      ),
    );
  }
}
