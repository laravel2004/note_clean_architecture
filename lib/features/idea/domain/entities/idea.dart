import 'package:equatable/equatable.dart';

class Idea extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? publishedAt;
  final bool? isImportant;

  const Idea({
    this.id,
    this.title,
    this.description,
    this.publishedAt,
    this.isImportant,
  });

  @override
  List<Object?> get props => [id!, title!, description!, publishedAt!, isImportant!];

}