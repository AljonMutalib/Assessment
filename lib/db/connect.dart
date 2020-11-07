import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../model/list_choice.dart';
import 'dart:io';
import 'dart:async';

class DbProvider{
  DbProvider._();
  static final DbProvider db = DbProvider._();
  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path,"choice.db"); 
      return await openDatabase(
        path,
        version: 1,
        onCreate: (Database db,int version) async{
          await db.execute("""
          CREATE TABLE choice(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          image TEXT,
          date TEXT,
          status TEXT)"""
      );
    });
  }
  Future<List<ChoiceModel>> getBackground() async {
    final db = await init();
    var res = await db.rawQuery('SELECT * FROM choice WHERE status=?', ['1']);
    if (res.isNotEmpty)
    return List.generate(res.length, (i) {
      return ChoiceModel(              
        id: res[i]['id'],
        image: res[i]['image'],
        date: res[i]['date'],
        status: res[i]['status']
      );
    });
  }
  Future<int> addChoice(ChoiceModel item, String photo) async{
    final db = await init();

    int count = await db.rawUpdate(
    'UPDATE choice SET status = ? WHERE image != ?',
    ['0', '$photo']);
    print('updated: $count');

    return db.insert("choice", item.toMap(),
    conflictAlgorithm: ConflictAlgorithm.ignore,
    );
    
 }
 Future<List<ChoiceModel>> getChoice() async{
    final db = await init();
    final maps = await db.query("choice");
    return List.generate(maps.length, (i) {
      return ChoiceModel(              
        id: maps[i]['id'],
        image: maps[i]['image'],
        date: maps[i]['date'],
        status: maps[i]['status']
      );
    
  });
  }   
}

