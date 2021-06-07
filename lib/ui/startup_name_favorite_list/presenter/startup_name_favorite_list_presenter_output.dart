import 'startup_name_favorite_list_view_model.dart';

abstract class StartupNameFavoriteListPresenterOutput {}

class ShowModel extends StartupNameFavoriteListPresenterOutput {
    final ViewModel model;
    ShowModel(this.model);
}

class ShowLoading extends StartupNameFavoriteListPresenterOutput {}
