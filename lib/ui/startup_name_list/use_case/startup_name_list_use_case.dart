import 'package:startup_namer_clean/ui/startup_name_list/use_case/startup_name_list_presenter_model.dart';
import 'package:startup_namer_clean/repo.dart';
import 'package:startup_namer_clean/ui/startup_name_list/use_case/startup_name_list_use_case_output.dart';
import '../../common/starter_bloc.dart';

class StartupNameListUseCase with StarterBloc<StartupNameListUseCaseOutput> {
  Repo _repo;

  StartupNameListUseCase(this._repo) {
    streamAdd(PresentLoading());
    eventGenerateSuggestions();
  }

  void _refreshDisplay() {
    final presentModelRowList = _repo.suggestionList
        .map((suggestion) => PresenterRowModel(
            id: suggestion.id,
            startupName: suggestion.startupName,
            isFavorite: _repo.isFavorite(suggestion.id)))
        .toList();
    streamAdd(PresentModel(PresenterModel(presentModelRowList)));
  }

  void eventGenerateSuggestions() {
    _repo.generateMoreSuggestions();
    _refreshDisplay();
  }

  void eventToggle(int id) {
    if (_repo.isFavorite(id)) {
      _repo.removeFavorite(id);
    } else {
      _repo.addFavorite(id);
    }
    _refreshDisplay();
  }
}
