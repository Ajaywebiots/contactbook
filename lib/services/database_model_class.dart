// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  Future<Database> getDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'create table login(id integer primary key autoincrement,email text, number text,password text)');
      await db.execute(
          'create table contact(id integer primary key autoincrement, name text, userid integer,number text)');
    });
    return database;
  }


  Future<void> insertContact(
      String name, String number, int userid, Database db) async {
    String data =
        "insert into contact(name,userid,number) values('$name','$userid','$number')";

    log("dfgdjhfg : $data");
    int cb = await db.rawInsert(data);

    print("SACE LOCAL : $cb");
  }

  //
  // Future<List<Map>> contactView(int userid, Database db) async {
  //   String contactViewData = "select * from contact where userid = '$userid'";
  //   List<Map> contactV = await db.rawQuery(contactViewData);
  //   return contactV;
  // }

  Future<void> update(
      String newName, String newNumber, int id, Database db) async {
    String updateContact =
        "update contact set name = '$newName', number = '$newNumber' where id = '$id'";
    int aa = await db.rawUpdate(updateContact);
  }

  Future<void> deleteContact(userid, Database db) async {
    String delete = "delete from contact where id ='$userid'";
    int aa = await db.rawDelete(delete);
  }

  Future<bool> insertData(String userEmail, String userNumber,
      Database database, String pass) async {
    String checkData = "select * from login where email = '$userEmail'";
    List<Map> selectedData = await database.rawQuery(checkData);
    if (selectedData.isEmpty) {
      String insertQuery =
          "insert into login(email,number,password) values('$userEmail','$userNumber','$pass')";
      database.rawInsert(insertQuery);
      return true;
    } else {
      return false;
    }
  }

  Future<List<Map>> loginUser(
      String loginEmail, String loginPass, Database database) async {
    String login =
        "select * from login where email = '$loginEmail' and password = '$loginPass'";
    List<Map> list = await database.rawQuery(login);
    print("===$list");
    return list;
  }

  Future<List<Map>> contactView(int userid, Database db) async {
      String contactViewData = "select * from contact where userid = '$userid'";
      List<Map> contactV = await db.rawQuery(contactViewData);
      return contactV;
    }
}
