import 'package:mobile/core/usecase/usecase.dart';
import 'package:mobile/features/idea/domain/entities/lean_canvas.dart';
import 'package:mobile/features/idea/domain/repositories/idea_repository.dart';

class GetLeanCanvasUseCase implements UseCase<LeanCanvas, String> {
  final IdeaRepository _ideaRepository;

  const GetLeanCanvasUseCase(this._ideaRepository);
  
  @override
  Future<LeanCanvas> call({String? params}) async {
    return await _ideaRepository.getLeanCanvas(params!);
  }
}