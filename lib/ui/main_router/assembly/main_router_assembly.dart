import 'package:startup_namer_clean/repo.dart';
import 'package:startup_namer_clean/ui/main_router/presenter/main_router_presenter.dart';
import 'package:startup_namer_clean/ui/main_router/use_case/main_router_use_case.dart';
import 'package:startup_namer_clean/ui/main_router/view/main_router_scene.dart';

class MainRouterAssembly {
  final MainRouterScene scene;
  MainRouterAssembly._({this.scene});

  factory MainRouterAssembly() {
    final useCase = MainRouterUseCase(Repo.repo);
    final presenter = MainRouterPresenter(useCase);
    final scene = MainRouterScene(presenter);

    return MainRouterAssembly._(scene: scene);
  }
}
