import 'package:startup_namer_clean/ui/main_router/use_case/main_router_use_case.dart';
import 'package:startup_namer_clean/ui/common/starter_bloc.dart';
import 'package:startup_namer_clean/ui/startup_name_favorite_list/router/startup_name_favorite_list_router.dart';
import 'package:startup_namer_clean/ui/startup_name_list/router/startup_name_list_router.dart';

import 'main_router_presenter_output.dart';

class MainRouterPresenter
    with StarterBloc<MainRouterPresenterOutput>
    implements StartupNameListRouter, StartupNameFavoriteListRouter {

  final MainRouterUseCase _useCase;
  MainRouterPresenter(this._useCase);

  // StartupNameFavoriteListRouter

  @override
  void routeFavoritesDone() {
    streamAdd(ShowPopFavorites());
  }

  // StartupNameListRouter

  @override
  void routeFavorites() {
    streamAdd(ShowFavorites());
  }

  @override
  void dispose() {
    _useCase.dispose();
    super.dispose();
  }
}
