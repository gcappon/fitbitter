// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class FitbitAccount extends DataClass implements Insertable<FitbitAccount> {
  final String id;
  final String displayName;
  final DateTime birthDate;
  final String gender;
  final double height;
  final double weight;
  final String avatar150;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  FitbitAccount(
      {required this.id,
      required this.displayName,
      required this.birthDate,
      required this.gender,
      required this.height,
      required this.weight,
      required this.avatar150,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  factory FitbitAccount.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return FitbitAccount(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      displayName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}display_name'])!,
      birthDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}birth_date'])!,
      gender:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}gender'])!,
      height:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}height'])!,
      weight:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}weight'])!,
      avatar150: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar150'])!,
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      deletedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}deleted_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['display_name'] = Variable<String>(displayName);
    map['birth_date'] = Variable<DateTime>(birthDate);
    map['gender'] = Variable<String>(gender);
    map['height'] = Variable<double>(height);
    map['weight'] = Variable<double>(weight);
    map['avatar150'] = Variable<String>(avatar150);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime?>(deletedAt);
    }
    return map;
  }

  FitbitAccountsCompanion toCompanion(bool nullToAbsent) {
    return FitbitAccountsCompanion(
      id: Value(id),
      displayName: Value(displayName),
      birthDate: Value(birthDate),
      gender: Value(gender),
      height: Value(height),
      weight: Value(weight),
      avatar150: Value(avatar150),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory FitbitAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FitbitAccount(
      id: serializer.fromJson<String>(json['id']),
      displayName: serializer.fromJson<String>(json['displayName']),
      birthDate: serializer.fromJson<DateTime>(json['birthDate']),
      gender: serializer.fromJson<String>(json['gender']),
      height: serializer.fromJson<double>(json['height']),
      weight: serializer.fromJson<double>(json['weight']),
      avatar150: serializer.fromJson<String>(json['avatar150']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'displayName': serializer.toJson<String>(displayName),
      'birthDate': serializer.toJson<DateTime>(birthDate),
      'gender': serializer.toJson<String>(gender),
      'height': serializer.toJson<double>(height),
      'weight': serializer.toJson<double>(weight),
      'avatar150': serializer.toJson<String>(avatar150),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  FitbitAccount copyWith(
          {String? id,
          String? displayName,
          DateTime? birthDate,
          String? gender,
          double? height,
          double? weight,
          String? avatar150,
          DateTime? createdAt,
          DateTime? updatedAt,
          DateTime? deletedAt}) =>
      FitbitAccount(
        id: id ?? this.id,
        displayName: displayName ?? this.displayName,
        birthDate: birthDate ?? this.birthDate,
        gender: gender ?? this.gender,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        avatar150: avatar150 ?? this.avatar150,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );
  @override
  String toString() {
    return (StringBuffer('FitbitAccount(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('birthDate: $birthDate, ')
          ..write('gender: $gender, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('avatar150: $avatar150, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          displayName.hashCode,
          $mrjc(
              birthDate.hashCode,
              $mrjc(
                  gender.hashCode,
                  $mrjc(
                      height.hashCode,
                      $mrjc(
                          weight.hashCode,
                          $mrjc(
                              avatar150.hashCode,
                              $mrjc(
                                  createdAt.hashCode,
                                  $mrjc(updatedAt.hashCode,
                                      deletedAt.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FitbitAccount &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.birthDate == this.birthDate &&
          other.gender == this.gender &&
          other.height == this.height &&
          other.weight == this.weight &&
          other.avatar150 == this.avatar150 &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class FitbitAccountsCompanion extends UpdateCompanion<FitbitAccount> {
  final Value<String> id;
  final Value<String> displayName;
  final Value<DateTime> birthDate;
  final Value<String> gender;
  final Value<double> height;
  final Value<double> weight;
  final Value<String> avatar150;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const FitbitAccountsCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.gender = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.avatar150 = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  FitbitAccountsCompanion.insert({
    required String id,
    required String displayName,
    required DateTime birthDate,
    required String gender,
    required double height,
    required double weight,
    required String avatar150,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
  })  : id = Value(id),
        displayName = Value(displayName),
        birthDate = Value(birthDate),
        gender = Value(gender),
        height = Value(height),
        weight = Value(weight),
        avatar150 = Value(avatar150),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<FitbitAccount> custom({
    Expression<String>? id,
    Expression<String>? displayName,
    Expression<DateTime>? birthDate,
    Expression<String>? gender,
    Expression<double>? height,
    Expression<double>? weight,
    Expression<String>? avatar150,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime?>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (birthDate != null) 'birth_date': birthDate,
      if (gender != null) 'gender': gender,
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
      if (avatar150 != null) 'avatar150': avatar150,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  FitbitAccountsCompanion copyWith(
      {Value<String>? id,
      Value<String>? displayName,
      Value<DateTime>? birthDate,
      Value<String>? gender,
      Value<double>? height,
      Value<double>? weight,
      Value<String>? avatar150,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return FitbitAccountsCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      avatar150: avatar150 ?? this.avatar150,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (avatar150.present) {
      map['avatar150'] = Variable<String>(avatar150.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime?>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FitbitAccountsCompanion(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('birthDate: $birthDate, ')
          ..write('gender: $gender, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('avatar150: $avatar150, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $FitbitAccountsTable extends FitbitAccounts
    with TableInfo<$FitbitAccountsTable, FitbitAccount> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FitbitAccountsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedTextColumn id = _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedTextColumn displayName = _constructDisplayName();
  GeneratedTextColumn _constructDisplayName() {
    return GeneratedTextColumn(
      'display_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _birthDateMeta = const VerificationMeta('birthDate');
  @override
  late final GeneratedDateTimeColumn birthDate = _constructBirthDate();
  GeneratedDateTimeColumn _constructBirthDate() {
    return GeneratedDateTimeColumn(
      'birth_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedTextColumn gender = _constructGender();
  GeneratedTextColumn _constructGender() {
    return GeneratedTextColumn(
      'gender',
      $tableName,
      false,
    );
  }

  final VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedRealColumn height = _constructHeight();
  GeneratedRealColumn _constructHeight() {
    return GeneratedRealColumn(
      'height',
      $tableName,
      false,
    );
  }

  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedRealColumn weight = _constructWeight();
  GeneratedRealColumn _constructWeight() {
    return GeneratedRealColumn(
      'weight',
      $tableName,
      false,
    );
  }

  final VerificationMeta _avatar150Meta = const VerificationMeta('avatar150');
  @override
  late final GeneratedTextColumn avatar150 = _constructAvatar150();
  GeneratedTextColumn _constructAvatar150() {
    return GeneratedTextColumn(
      'avatar150',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedDateTimeColumn createdAt = _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedDateTimeColumn updatedAt = _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      false,
    );
  }

  final VerificationMeta _deletedAtMeta = const VerificationMeta('deletedAt');
  @override
  late final GeneratedDateTimeColumn deletedAt = _constructDeletedAt();
  GeneratedDateTimeColumn _constructDeletedAt() {
    return GeneratedDateTimeColumn(
      'deleted_at',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        displayName,
        birthDate,
        gender,
        height,
        weight,
        avatar150,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  $FitbitAccountsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'fitbit_accounts';
  @override
  final String actualTableName = 'fitbit_accounts';
  @override
  VerificationContext validateIntegrity(Insertable<FitbitAccount> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta));
    } else if (isInserting) {
      context.missing(_birthDateMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('avatar150')) {
      context.handle(_avatar150Meta,
          avatar150.isAcceptableOrUnknown(data['avatar150']!, _avatar150Meta));
    } else if (isInserting) {
      context.missing(_avatar150Meta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FitbitAccount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FitbitAccount.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FitbitAccountsTable createAlias(String alias) {
    return $FitbitAccountsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $FitbitAccountsTable fitbitAccounts = $FitbitAccountsTable(this);
  late final FitbitAccountsDao fitbitAccountsDao =
      FitbitAccountsDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [fitbitAccounts];
}
