import 'package:startup_namer_clean/repo.dart';
import 'package:startup_namer_clean/ui/common/starter_bloc.dart';
import 'main_router_use_case_output.dart';

class MainRouterUseCase with StarterBloc<MainRouterUseCaseOutput> {
  final Repo _repository;

  MainRouterUseCase(this._repository);
}
