import 'package:startup_namer_clean/repo.dart';
import 'package:startup_namer_clean/ui/startup_name_favorite_list/use_case/startup_name_favorite_list_presenter_model.dart';
import 'package:startup_namer_clean/ui/startup_name_favorite_list/use_case/startup_name_favorite_list_use_case_output.dart';
import '../../common/starter_bloc.dart';
import 'startup_name_favorite_list_presenter_model.dart';

class StartupNameFavoriteListUseCase with StarterBloc<StartupNameFavoriteListUseCaseOutput> {
  Repo _repo;

  StartupNameFavoriteListUseCase(this._repo) {
    _initialize();
  }

  void _initialize() {
    final favorites = _repo.favoriteList
      .map((favorite) => PresenterRowModel(startupName: favorite)).toList();
    streamAdd(PresentModel(PresenterModel(rows: favorites)));
  }
}
