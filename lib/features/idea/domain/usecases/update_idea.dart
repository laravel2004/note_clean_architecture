import 'package:mobile/core/usecase/usecase.dart';
import 'package:mobile/features/idea/domain/entities/idea.dart';
import 'package:mobile/features/idea/domain/repositories/idea_repository.dart';

class UpdateIdeaUseCase implements UseCase<void, Idea> {
  final IdeaRepository _ideaRepository;
  UpdateIdeaUseCase(this._ideaRepository);
  @override
  Future<void> call({Idea? params}) async {
    return await _ideaRepository.updateIdea(params!);
  }
}