import 'package:firebase_database/firebase_database.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  final DatabaseReference db = FirebaseDatabase.instance.reference();


  //-----------------REGISTRATION-----------------

  Future addUser(String name, String surname) async{
    return await db.child("users").child(uid).set({
      'name': name,
      'surname': surname,
    });
  }

//-----------------DIARY-----------------

  Future addDiary(String book, String author, String genre, String notes) async{

    return await db.child("deniky").child(uid).push().set({
      'book': book,
      'author': author,
      'genre': genre,
      'notes': notes,
    });
  }

  Future updateDiary(String book, String author, String genre, String notes, String bookId) async{

    return await db.child("deniky").child(uid).child(bookId).update({
      'book': book,
      'author': author,
      'genre': genre,
      'notes': notes,
    });
  }

  Future deleteDiary(String bookId) async {
    return await  db.child("deniky").child(uid).child(bookId).remove();
  }

  //-----------------TESTING-----------------

  Future uidIs() async
  {
    print(uid);
  }

}