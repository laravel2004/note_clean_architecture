import 'package:equatable/equatable.dart';
import 'package:mobile/features/idea/domain/entities/idea.dart';

abstract class LocalIdeaEvent extends Equatable {

  final Idea? idea;
  
  const LocalIdeaEvent({this.idea});

  @override
  List<Object> get props => [idea!];

}

class AddIdea extends LocalIdeaEvent {
  const AddIdea({required Idea idea}) : super(idea: idea);
}

class GetIdea extends LocalIdeaEvent {
  const GetIdea();
}

class UpdateIdea extends LocalIdeaEvent {
  const UpdateIdea({required Idea idea}) : super(idea: idea);
}

class DeleteIdea extends LocalIdeaEvent {
  const DeleteIdea({required Idea idea}) : super(idea: idea);
}

class GetLeanCanvas extends LocalIdeaEvent {
  const GetLeanCanvas();
}


