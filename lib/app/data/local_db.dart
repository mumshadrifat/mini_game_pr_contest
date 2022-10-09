import 'dart:io';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

import '../model/local_model/best_score.dart';



class DataBaseHelper {
  DataBaseHelper._privateConstructor();

  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();
  static Database? _database;
  RxInt insId = 0.obs;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "test.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  // void _onCreate(Database db, int version) async {
  //   // When creating the db, create the table
  //   await db.execute(
  //       "CREATE TABLE Inspection(id INTEGER PRIMARY KEY, stucureId TEXT, age INTEGER)");
  //   print("Created tables");
  // }
  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE bestScoreTable(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, bestScore INTEGER)',
    );


  }

  Future<int?> insertBestScoreTable(BestScore bestScore) async {
    Database? db = await instance.database;
    var result = await db?.insert('bestScoreTable', bestScore.toJson());


    print("ins_id==>${result}");


    print("inserted BestScore");
    return result;
  }
  Future<int?>  tableIsEmpty()async{
    Database? db = await instance.database;

    int? count = Sqflite.firstIntValue(await db!.rawQuery('SELECT COUNT(*) FROM bestScoreTable'));
    print(count);
    return count;

  }




  Future<List<Map>> newQuery(int insId) async {
    Database? db = await instance.database;

    List<Map> result = await db!
        .rawQuery("SELECT * FROM bestScoreTable WHERE id=1");



    return result;
  }



Future<int?> updaate(BestScore bestScore) async {
  Database? db = await instance.database;
  var result = await db?.update("bestScoreTable", bestScore.toJson(),
      where: "id =1");
  print("updated successFully");
  return result;

}




}


