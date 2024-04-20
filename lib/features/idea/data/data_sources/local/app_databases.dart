import 'package:floor/floor.dart';
import 'package:mobile/features/idea/data/data_sources/local/DAO/idea_dao.dart';
import 'package:mobile/features/idea/data/models/idea.dart';
import 'dart:async';
import "package:sqflite/sqflite.dart" as sqflite;

part "app_databases.g.dart";

@Database(version: 1, entities: [IdeaModel])
abstract class AppDatabases extends FloorDatabase {
  IdeaDao get ideaDao;
}