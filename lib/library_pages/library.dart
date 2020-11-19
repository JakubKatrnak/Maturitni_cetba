import 'package:flutter/material.dart';
import 'package:projekt_prj/library_pages/book.dart';
import 'package:projekt_prj/quote.dart';


class BooksList extends StatefulWidget {
  @override
  _BooksListState createState() => _BooksListState();
}

class Quote {

  String url;
  String nazev;
  String author;

  Quote({this.url, this.nazev, this.author});
}

class _BooksListState extends State<BooksList> {

  List<Quote> _quotes = [
    Quote(
        url: 'https://www.databazeknih.cz/img/books/26_/26831/big_zlodejka-knih-43M-26831.jpg',
        nazev: 'Název knihy',
        author: 'Oscar Wilde'),
    Quote(
        url: 'https://www.databazeknih.cz/img/books/58_/588/big_kytice-5XM-588.jpg',
        nazev: 'Název knihy',
        author: 'William Shakespeare'),
    Quote(url: 'https://www.databazeknih.cz/img/books/11_/1151/maj-1151.jpg',
        nazev: 'Název knihy',
        author: 'Leonardo da Vinci'),
    Quote(
        url: 'https://www.databazeknih.cz/img/books/26_/26831/big_zlodejka-knih-43M-26831.jpg',
        nazev: 'Název knihy',
        author: 'Oscar Wilde'),
    Quote(
        url: 'https://www.databazeknih.cz/img/books/58_/588/big_kytice-5XM-588.jpg',
        nazev: 'Název knihy',
        author: 'William Shakespeare'),
    Quote(url: 'https://www.databazeknih.cz/img/books/11_/1151/maj-1151.jpg',
        nazev: 'Název knihy',
        author: 'Leonardo da Vinci'),
  ];

  List obdobi = [
  'Světová a česká 18. století',
  'Světová a česká 19. století',
  'světová 20. a 21. století',
  'Česká 20. a 21. století',
  ];
  String obdobiVal;

  Widget quoteTemplate(_quote) {
    return Card(
      color: Color(0xFF1976D2),
      margin: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0),
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Book()),
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
                  Container(
                    child: Image.network(_quote.url,
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        ' ' + _quote.nazev,
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Text(
                        ' autor: ' + _quote.author,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 6.0),
                    ],
                  )
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
          title: Text('NÁZEV ŠKOLY'),
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
          scrollDirection: Axis.vertical,
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
                        hint: Text(' Vyber školu',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: Icon(Icons.arrow_circle_down, color: Colors.white,),
                        iconSize: 24,
                        value: obdobiVal,
                        onChanged: (value) {
                          setState(() {
                            obdobiVal = value;
                          });
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
                for(var quote in _quotes) quoteTemplate(quote)
              ],
            ),
          ],
        ),
        ),
      );
    }
}
