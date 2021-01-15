import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

import 'daos.dart';

part 'database.g.dart';

class FitbitAccounts extends Table {
  TextColumn get id => text()();
  Set<Column> get primaryKey => {id};
  TextColumn get displayName => text()();
  DateTimeColumn get birthDate => dateTime()();
  TextColumn get gender => text()();
  RealColumn get height => real()();
  RealColumn get weight => real()();
  TextColumn get avatar150 => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
} //FitbitAccounts

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
} // _openConnection

@UseMoor(
  tables: [FitbitAccounts],
  daos: [FitbitAccountsDao],
)
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
} // MyDatabase
