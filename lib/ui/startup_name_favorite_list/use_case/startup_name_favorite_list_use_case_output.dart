import 'startup_name_favorite_list_presenter_model.dart';

abstract class StartupNameFavoriteListUseCaseOutput {}

class PresentModel extends StartupNameFavoriteListUseCaseOutput {
  final PresenterModel model;
  PresentModel(this.model);
}

class PresentLoading extends StartupNameFavoriteListUseCaseOutput {}
