import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabastHelper{

  static final _dbName ='mem.db';
  static final _dbver =1;
  static final  _tablename='memTable';

  static final colID='_if';
  static final colName ='_name';

  DatabastHelper._privateConstructor();
  static final DatabastHelper instance =DatabastHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async{
    if(_database !=null)return _database;
    _database =await _initDB();
    return _database;
  }
  _initDB() async{
    Directory dic = await getApplicationDocumentsDirectory();
    String path = join(dic.path,_dbName);
    return await openDatabase(path,version : _dbver,onCreate: _onCreat);


  }

  Future _onCreat(Database db ,int version){
    db.execute(
      '''
      CREAT TABLE $_tablename( 
      $colID INTERGER PRIMARY KEY,
      $colName TEXT NOT NULL )      
      '''
    );
  }
  Future<int> insert(Map<String, dynamic> row) async{
    Database db = await instance.database;
    return await db.insert(_tablename, row);
  }

  Future<List<Map<String,dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tablename);
  }
  Future<int> update(Map<String, dynamic> row) async{
    Database db = await instance.database;
    int id = row[colID];
     return await db.update(_tablename,row,where: '$colID = ? $colName = ?', whereArgs: [id]);

  }
  
  Future<int> delet(int id)async{
    Database db = await instance.database;
    return await db.delete(_tablename,where: '$colID = ?', whereArgs: [id]);
    
  }



}