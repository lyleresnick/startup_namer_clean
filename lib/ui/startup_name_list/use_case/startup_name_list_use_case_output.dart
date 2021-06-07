import 'package:startup_namer_clean/ui/startup_name_list/use_case/startup_name_list_presenter_model.dart';

abstract class StartupNameListUseCaseOutput {}

class PresentModel extends StartupNameListUseCaseOutput {
  final PresenterModel model;
  PresentModel(this.model);
}

class PresentLoading extends StartupNameListUseCaseOutput {}
