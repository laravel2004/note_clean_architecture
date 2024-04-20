import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/idea/domain/usecases/add_idea.dart';
import 'package:mobile/features/idea/domain/usecases/delete_idea.dart';
import 'package:mobile/features/idea/domain/usecases/get_idea.dart';
import 'package:mobile/features/idea/domain/usecases/update_idea.dart';
import 'package:mobile/features/idea/presentation/bloc/local/local_idea_event.dart';
import 'package:mobile/features/idea/presentation/bloc/local/local_idea_state.dart';

class LocalIdeaBloc extends Bloc<LocalIdeaEvent, LocalIdeaState> {
  final AddIdeaUseCase _addIdeaUseCase;
  final GetIdeaUseCase _getIdeaUseCase;
  final UpdateIdeaUseCase _updateIdeaUseCase;
  final DeleteIdeaUseCase _deleteIdeaUseCase;

  LocalIdeaBloc(this._addIdeaUseCase, this._getIdeaUseCase, this._updateIdeaUseCase, this._deleteIdeaUseCase) : super(const LocalIdeaLoading()) {
    on<AddIdea>(_onAddIdea);
    on<GetIdea>(_onGetIdea);
    on<UpdateIdea>(_onUpdateIdea);
    on<DeleteIdea>(_onDeleteIdea);
  }

  void _onDeleteIdea(DeleteIdea event, Emitter<LocalIdeaState> emit) async {
    try {
      await _deleteIdeaUseCase(params: event.idea);
      final idea = await _getIdeaUseCase();
      emit(LocalIdeaDone(idea));
    }
    catch(e) {
      emit(LocalIdeaError(e.toString()));
    }
  }

  void _onUpdateIdea(UpdateIdea event, Emitter<LocalIdeaState>emit) async {
    await _updateIdeaUseCase(params: event.idea );
    final idea = await _getIdeaUseCase();
    emit(LocalIdeaDone(idea));
  }

  void _onAddIdea(AddIdea event, Emitter<LocalIdeaState> emit) async {
    try {
      await _addIdeaUseCase(params: event.idea);
      final idea = await _getIdeaUseCase();
      emit(LocalIdeaDone(idea));
    } catch (e) {
      // Handle error
      emit(LocalIdeaError(e.toString()));
    }
  }

  void _onGetIdea(GetIdea event, Emitter<LocalIdeaState> emit) async {
    try {
      final idea = await _getIdeaUseCase();
      emit(LocalIdeaDone(idea));
    } catch (e) {
      // Handle error
      emit(LocalIdeaError(e.toString()));
    }
  }
}
