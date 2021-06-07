import 'package:startup_namer_clean/ui/startup_name_list/presenter/startup_name_list_view_model.dart';

abstract class StartupNameListPresenterOutput {}

class ShowModel extends StartupNameListPresenterOutput {
    final ViewModel model;
    ShowModel(this.model);
}

class ShowLoading extends StartupNameListPresenterOutput {}
