import 'package:floor/floor.dart';
import 'package:mobile/features/idea/domain/entities/idea.dart';

@Entity(tableName: 'ideas', primaryKeys: ['id'])
class IdeaModel extends Idea {
  const IdeaModel({
     int? id,
     String? title,
     String? description,
     String? publishedAt,
     bool? isImportant,
  }) : super(
    id: id,
    title: title,
    description: description,
    publishedAt: publishedAt,
    isImportant: isImportant,
  );

  factory IdeaModel.fromJson(Map<String, dynamic> map) {
    return IdeaModel(
      id: map['id'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      publishedAt: map['publishedAt'] ?? "",
      isImportant: map['isImportant'] ?? "",
    );
  }

  factory IdeaModel.fromEntity(Idea idea) {
    return IdeaModel(
      id: idea.id,
      description: idea.description,
      title: idea.title,
      publishedAt: idea.publishedAt,
      isImportant: idea.isImportant,
    );
  }
}