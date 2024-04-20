import 'package:mobile/features/idea/data/data_sources/local/app_databases.dart';
import 'package:mobile/features/idea/data/models/idea.dart';
import 'package:mobile/features/idea/data/models/lean_canvas.dart';
import 'package:mobile/features/idea/domain/entities/idea.dart';
import 'package:mobile/features/idea/domain/entities/lean_canvas.dart';
import 'package:mobile/features/idea/domain/repositories/idea_repository.dart';
import 'package:dio/dio.dart';

class IdeaRepositoryImpl implements IdeaRepository {

  final AppDatabases _appDatabases;
  final Dio _dio;

  const IdeaRepositoryImpl(this._appDatabases, this._dio);


  @override
  Future<List<Idea>> getIdeas() async{
    final data = await _appDatabases.ideaDao.getArticles();
    return data;
  }

  
  @override
  Future<void> addIdea(Idea idea) async {
   return await _appDatabases.ideaDao.insertIdea(IdeaModel.fromEntity(idea));
  }
  
  @override
  Future<void> deleteIdea(Idea idea) async {
    return await _appDatabases.ideaDao.deleteIdea(IdeaModel.fromEntity(idea));
  }
  
  @override
  Future<void> updateIdea(Idea idea) async {
    return await _appDatabases.ideaDao.updateIdea(IdeaModel.fromEntity(idea));
  }
  

  @override
  Future<LeanCanvas> getLeanCanvas(String description) async {
    try {
      String url = 'https://api.getemailnames.com/api/lean-canvas/generate';

      Map<String, dynamic> payload = {'description': description};

      Response response = await _dio.post(url, data: payload);

      if (response.statusCode == 200) {
        return LeanCanvasModel.fromJson(response.data['canvas']);
      } else {
        throw Exception('Failed to post Lean Canvas: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to post Lean Canvas: $error');
    }
  }
  
}