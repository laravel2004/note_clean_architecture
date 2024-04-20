// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_databases.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabases {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabasesBuilder databaseBuilder(String name) =>
      _$AppDatabasesBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabasesBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabasesBuilder(null);
}

class _$AppDatabasesBuilder {
  _$AppDatabasesBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabasesBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabasesBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabases> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabases();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabases extends AppDatabases {
  _$AppDatabases([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  IdeaDao? _ideaDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ideas` (`id` INTEGER, `title` TEXT, `description` TEXT, `publishedAt` TEXT, `isImportant` INTEGER, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  IdeaDao get ideaDao {
    return _ideaDaoInstance ??= _$IdeaDao(database, changeListener);
  }
}

class _$IdeaDao extends IdeaDao {
  _$IdeaDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _ideaModelInsertionAdapter = InsertionAdapter(
            database,
            'ideas',
            (IdeaModel item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'publishedAt': item.publishedAt,
                  'isImportant': item.isImportant == null
                      ? null
                      : (item.isImportant! ? 1 : 0)
                }),
        _ideaModelUpdateAdapter = UpdateAdapter(
            database,
            'ideas',
            ['id'],
            (IdeaModel item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'publishedAt': item.publishedAt,
                  'isImportant': item.isImportant == null
                      ? null
                      : (item.isImportant! ? 1 : 0)
                }),
        _ideaModelDeletionAdapter = DeletionAdapter(
            database,
            'ideas',
            ['id'],
            (IdeaModel item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'publishedAt': item.publishedAt,
                  'isImportant': item.isImportant == null
                      ? null
                      : (item.isImportant! ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<IdeaModel> _ideaModelInsertionAdapter;

  final UpdateAdapter<IdeaModel> _ideaModelUpdateAdapter;

  final DeletionAdapter<IdeaModel> _ideaModelDeletionAdapter;

  @override
  Future<List<IdeaModel>> getArticles() async {
    return _queryAdapter.queryList('SELECT * FROM ideas',
        mapper: (Map<String, Object?> row) => IdeaModel(
            id: row['id'] as int?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            publishedAt: row['publishedAt'] as String?,
            isImportant: row['isImportant'] == null
                ? null
                : (row['isImportant'] as int) != 0));
  }

  @override
  Future<void> insertIdea(IdeaModel ideaModel) async {
    await _ideaModelInsertionAdapter.insert(
        ideaModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateIdea(IdeaModel ideaModel) async {
    await _ideaModelUpdateAdapter.update(ideaModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteIdea(IdeaModel ideaModel) async {
    await _ideaModelDeletionAdapter.delete(ideaModel);
  }
}
