import 'package:mobile/core/usecase/usecase.dart';
import 'package:mobile/features/idea/domain/entities/idea.dart';
import 'package:mobile/features/idea/domain/repositories/idea_repository.dart';

class GetIdeaUseCase implements UseCase<List<Idea>, void> {

  final IdeaRepository _ideaRepository;

  GetIdeaUseCase(this._ideaRepository);

  @override
  Future<List<Idea>> call({void params}) async {
    return await _ideaRepository.getIdeas();
  }
  
}