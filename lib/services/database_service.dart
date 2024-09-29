import 'package:path/path.dart';
import 'package:payuung_clone/models/wellness.dart';
import 'package:sqflite/sqflite.dart';

import '../models/profile.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();
  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final dirPath = await getDatabasesPath();
    final dbPath = join(dirPath, 'payuung.db');
    final database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE profile (id INTEGER PRIMARY KEY, fullname TEXT,'
          ' dob TEXT, sex TEXT, email TEXT, hp TEXT, education TEXT '
          'marital_status TEXT, nik TEXT, ktp_image TEXT, address TEXT, province TEXT, city TEXT, distric TEXT, kelurahan TEXT, postal_code INTEGER, domicile_address TEXT, domicile_province TEXT, domicile_city TEXT, domicile_distric TEXT, domicile_kelurahan TEXT, domicile_postal_code INTEGER, company TEXT, company_address TEXT, position TEXT, work_duration TEXT, source_income TEXT, gross_income TEXT, bank_name TEXT, bank_branch TEXT, account_number TEXT, account_holder TEXT)',
        );

        await db.execute(
            'CREATE TABLE wellness (id INTEGER PRIMARY KEY, title TEXT, image TEXT, discount NUM, old_price NUM, price NUM)');

        db.insert('profile', {
          'fullname': 'Muhammad Ibra',
          'dob': '1990-01-30',
          'sex': 'Laki-laki',
          'email': 'example@mai.com',
          'hp': '089898989898',
        });

        db.insert('wellness', {
          'title': 'Voucher Indomaret Rp25.000',
          'price': 25000,
          'image': 'indomaret.png',
        });
        db.insert('wellness', {
          'title': 'Voucher GrabFood Rp50.000',
          'price': 49000,
          'image': 'grab.png',
          'old_price': 50000,
          'discount': 3,
        });
        db.insert('wellness', {
          'title': 'Voucher Gojek Rp25.000',
          'price': 25000,
          'image': 'gojek.png',
        });
        db.insert('wellness', {
          'title': 'Voucher H&M p25.000',
          'price': 25000,
          'image': 'hm.png',
        });
        db.insert('wellness', {
          'title': 'Voucher Alfamart Rp25.000',
          'price': 30000,
          'discount': 11,
          'old_price': 32000,
          'image': 'alfamart.png'
        });
        db.insert('wellness', {
          'title': 'Voucher GrabFood Rp25.000',
          'price': 25000,
          'image': 'grab.png'
        });
      },
    );
    return database;
  }

  Future<Profile> getProfile() async {
    final db = await database;
    List<Map<String, Object?>> profiles = await db.query('profile');
    Map<String, Object?> profile = profiles.first;
    return Profile.fromJson(profile);
  }

  Future<List<Wellness>> getWellness() async {
    final db = await database;
    final wellness = await db.query('wellness');
    List<Wellness> list = wellness.map((e) => Wellness.fromJson(e)).toList();
    return list;
  }
}
