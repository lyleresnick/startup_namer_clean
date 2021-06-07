import 'package:startup_namer_clean/repo.dart';
import 'package:startup_namer_clean/ui/startup_name_favorite_list/presenter/startup_name_favorite_list_presenter.dart';
import 'package:startup_namer_clean/ui/startup_name_favorite_list/router/startup_name_favorite_list_router.dart';
import 'package:startup_namer_clean/ui/startup_name_favorite_list/use_case/startup_name_favorite_list_use_case.dart';
import 'package:startup_namer_clean/ui/startup_name_favorite_list/view/startup_name_favorite_list_scene.dart';

class StartupNameFavoriteListAssembly {
    final StartupNameFavoriteListScene scene;

    StartupNameFavoriteListAssembly._({this.scene});

    factory StartupNameFavoriteListAssembly(StartupNameFavoriteListRouter router) {
        final useCase = StartupNameFavoriteListUseCase(Repo.repo);
        final presenter = StartupNameFavoriteListPresenter(useCase, router);
        final scene = StartupNameFavoriteListScene(presenter);

        return StartupNameFavoriteListAssembly._(scene: scene);
    }
}


