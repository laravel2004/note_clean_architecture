
import 'package:floor/floor.dart';
import 'package:mobile/features/idea/data/models/idea.dart';
import 'package:mobile/features/idea/domain/entities/idea.dart';

@dao
abstract class IdeaDao {
  @Insert()
  Future<void> insertIdea(IdeaModel ideaModel);

  @delete
  Future<void> deleteIdea(IdeaModel ideaModel);

  @Query('SELECT * FROM ideas')
  Future<List<IdeaModel>> getArticles();

  @update
  Future<void> updateIdea(IdeaModel ideaModel);
}