import 'package:flutter/material.dart';
import '../quote.dart';

class Book extends StatefulWidget {
  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width*0.8;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          title: Text('MATURITNÍ ČETBA'),
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
            image: AssetImage('assets/images/background_book.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Image.network('https://www.databazeknih.cz/img/books/26_/26831/big_zlodejka-knih-43M-26831.jpg',
                      height: 300,
                      ),
                    ),
                    SizedBox(width: 12.0),
                    Column(
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
                          'Jméno autora',
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
                          'Název žánru',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          'Rok vydání',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Rok',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          'Počet stran',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'číslo',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          'ISBN',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'číslo ISBN',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
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
                      'Stručný obsah:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Mauris dolor felis, sagittis at, luctus sed, aliquam non, tellus. Nullam at arcu a est sollicitudin euismod. Maecenas ipsum velit, consectetuer eu lobortis ut, dictum at dui. Praesent id justo in neque elementum ultrices. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nullam dapibus fermentum ipsum. Vestibulum erat nulla, ullamcorper nec, rutrum non, nonummy ac, erat. Fusce nibh. Aliquam in lorem sit amet leo accumsan lacinia. Duis bibendum, lectus ut viverra rhoncus, dolor nunc faucibus libero, eget facilisis enim ipsum id lacus. Morbi imperdiet, mauris ac auctor dictum, nisl ligula egestas nulla, et sollicitudin sem purus in lacus.',
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
      ),
    );
  }
}
