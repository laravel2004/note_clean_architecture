import 'package:mobile/features/idea/domain/entities/idea.dart';
import 'package:mobile/features/idea/domain/entities/lean_canvas.dart';

abstract class IdeaRepository {

  Future<List<Idea>> getIdeas();

  Future<void> addIdea(Idea idea);

  Future<void> updateIdea(Idea idea);

  Future<void> deleteIdea(Idea idea);

  Future<LeanCanvas> getLeanCanvas(String description);
}