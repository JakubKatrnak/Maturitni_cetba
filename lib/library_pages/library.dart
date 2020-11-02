import 'package:flutter/material.dart';
import 'package:projekt_prj/quote.dart';

class BooksList extends StatefulWidget {
  @override
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  List<Quote> quotes = [
    Quote(author: 'Oscar Wilde', text: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit'),
    Quote(author: 'William Shakespeare', text: 'Fusce tellus. Sed vel lectus. Donec odio tempus molestie.'),
    Quote(author: 'Leonardo da Vinci', text: 'Nunc tincidunt ante vitae massa. In sem justo, commodo ut.'),
  ];

  Widget quoteTemplate(quote){
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset('assets/images/Image_3.jpg', width: 50, height: 100,),
            ),
            Text(
              'autor: ' + quote.author,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[900],
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              'úryvek: ' + quote.text,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'OAUH',
          style: TextStyle(
            fontSize: 24,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Column(
        children: quotes.map((quote) => quoteTemplate(quote)).toList(),
      ),
    );
  }
}
