import 'package:moor/moor.dart';
import 'database.dart';

part 'fitbitAccountsDao.g.dart';

@UseDao(tables: [FitbitAccounts])
class FitbitAccountsDao extends DatabaseAccessor<MyDatabase>
    with _$FitbitAccountsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  FitbitAccountsDao(MyDatabase db) : super(db);

  Stream<FitbitAccount> watchFitbitAccount() {
    return select(fitbitAccounts).watchSingle();
  } // watchFitbitAccount

  Stream<FitbitAccount> watchFitbitAccountByID(String id) {
    final result = select(fitbitAccounts)..where((t) => t.id.equals(id));
    return (result).watchSingle();
  } // watchFitbitAccount

  Future<FitbitAccount> getFitbitAccount() {
    return select(fitbitAccounts).getSingle();
  } // watchFitbitAccount

  Future<int> insertFitbitAccount(FitbitAccount fitbitAccount) {
    return into(fitbitAccounts).insert(fitbitAccount);
  } // insertFitbitAccount

  Future updateFitbitAccount(FitbitAccount fitbitAccount) {
    return update(fitbitAccounts).replace(fitbitAccount);
  } // updateFitbitAccount

  Future deleteFitbitAccountByID(String id) {
    return (delete(fitbitAccounts)..where((t) => (t.id.equals(id)))).go();
  } // deleteFitbitAccount

} // FitbitAccountsDao
