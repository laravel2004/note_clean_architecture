import 'package:mobile/core/usecase/usecase.dart';
import 'package:mobile/features/idea/domain/entities/idea.dart';
import 'package:mobile/features/idea/domain/repositories/idea_repository.dart';

class AddIdeaUseCase implements UseCase<void, Idea> {
  final IdeaRepository _ideaRepository;
  const AddIdeaUseCase(this._ideaRepository);
  
  @override
  Future<void> call({Idea? params}) {
    return _ideaRepository.addIdea(params!);
  }
  

}