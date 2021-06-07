import 'package:startup_namer_clean/ui/common/starter_bloc.dart';
import 'package:startup_namer_clean/ui/startup_name_favorite_list/router/startup_name_favorite_list_router.dart';
import 'package:startup_namer_clean/ui/startup_name_favorite_list/use_case/startup_name_favorite_list_use_case.dart';
import 'package:startup_namer_clean/ui/startup_name_favorite_list/use_case/startup_name_favorite_list_use_case_output.dart';

import 'startup_name_favorite_list_presenter_output.dart';
import 'startup_name_favorite_list_view_model.dart';

class StartupNameFavoriteListPresenter
    with StarterBloc<StartupNameFavoriteListPresenterOutput> {
  final StartupNameFavoriteListUseCase _useCase;
  final StartupNameFavoriteListRouter _router;

  StartupNameFavoriteListPresenter(this._useCase, this._router) {
    _useCase.stream.listen((event) {
      if (event is PresentLoading) {
        streamAdd(ShowLoading());
      } else if (event is PresentModel) {
        streamAdd(ShowModel(ViewModel.fromPresentation(event.model)));
      } else {
        assert(false, "unknown event $event");
        return null;
      }
    });
  }

  @override
  void dispose() {
    _useCase.dispose();
    super.dispose();
  }
}
