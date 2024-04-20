import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/features/idea/data/data_sources/local/app_databases.dart';
import 'package:mobile/features/idea/data/repository/idea_repository_impl.dart';
import 'package:mobile/features/idea/domain/repositories/idea_repository.dart';
import 'package:mobile/features/idea/domain/usecases/add_idea.dart';
import 'package:mobile/features/idea/domain/usecases/delete_idea.dart';
import 'package:mobile/features/idea/domain/usecases/get_idea.dart';
import 'package:mobile/features/idea/domain/usecases/get_lean_canvas.dart';
import 'package:mobile/features/idea/domain/usecases/update_idea.dart';
import 'package:mobile/features/idea/presentation/bloc/local/local_idea_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database = await $FloorAppDatabases.databaseBuilder('app_databases.db').build();
  sl.registerSingleton<AppDatabases>(database);

  sl.registerSingleton<Dio>(Dio());

  sl.registerLazySingleton<IdeaRepository>(() => IdeaRepositoryImpl(sl(), sl()));

  sl.registerLazySingleton(() => GetIdeaUseCase(sl()));
  sl.registerLazySingleton(() => AddIdeaUseCase(sl()));
  sl.registerLazySingleton(() => UpdateIdeaUseCase(sl()));
  sl.registerLazySingleton(() => DeleteIdeaUseCase(sl()));
  sl.registerLazySingleton(() => GetLeanCanvasUseCase(sl()));
  
  sl.registerFactory(() => LocalIdeaBloc(sl(), sl(), sl(), sl()));

}