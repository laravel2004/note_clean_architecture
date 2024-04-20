import 'package:equatable/equatable.dart';
import 'package:mobile/features/idea/domain/entities/idea.dart';

abstract class LocalIdeaState extends Equatable {
  final List<Idea>? idea;
  final String? error;
  const LocalIdeaState({this.idea, this.error});

  @override
  List<Object> get props => [idea!];
}

class LocalIdeaLoading extends LocalIdeaState {
  const LocalIdeaLoading();
}

class LocalIdeaDone extends LocalIdeaState {
  const LocalIdeaDone(List<Idea> idea) : super(idea: idea);
}

class LocalIdeaError extends LocalIdeaState {
  const LocalIdeaError(String error) : super(error: error);
}