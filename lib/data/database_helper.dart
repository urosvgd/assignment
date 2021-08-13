import 'dart:io';

import 'package:moja_garaza/models/car.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const String TABLE_NAME = 'cars';
  static final _dbName = "cars.db";
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static late Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    // Instantiate the database only when it's not been initialized yet.
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
  // Creates the database structure
  Future _onCreate(
    Database db,
    int version,
  ) async {
    await db.execute('''
          CREATE TABLE Cars (
            id TEXT PRIMARY KEY,
            carProducer TEXT NOT NULL,
            carModel TEXT NOT NULL,
            color TEXT NOT NULL,
            plateNumber TEXT NOT NULL,
            v INTEGER NOT NULL
          )
          ''');
  }

   Future<int> insertCar(Car car) async {
    return await _database!.insert(TABLE_NAME, car.toJson());
  }

}
