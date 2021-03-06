
import 'package:startup_namer_clean/ui/startup_name_list/presenter/startup_name_list_presenter.dart';
import 'package:startup_namer_clean/ui/startup_name_list/router/startup_name_list_router.dart';
import 'package:startup_namer_clean/ui/startup_name_list/use_case/startup_name_list_use_case.dart';
import 'package:startup_namer_clean/repo.dart';
import 'package:startup_namer_clean/ui/startup_name_list/view/startup_name_list_scene.dart';

class StartupNameListAssembly {
    final StartupNameListScene scene;

    StartupNameListAssembly._({this.scene});

    factory StartupNameListAssembly(StartupNameListRouter router) {
        final useCase = StartupNameListUseCase(Repo.repo);
        final presenter = StartupNameListPresenter(useCase, router);
        final scene = StartupNameListScene(presenter);

        return StartupNameListAssembly._(scene: scene);
    }
}
