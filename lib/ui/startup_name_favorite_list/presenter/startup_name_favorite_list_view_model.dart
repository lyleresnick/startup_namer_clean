
import 'package:startup_namer_clean/ui/startup_name_favorite_list/use_case/startup_name_favorite_list_presenter_model.dart';

class ViewRowModel {
  final String startupName;

  ViewRowModel.fromPresentation(PresenterRowModel row)
      : startupName = row.startupName;
}

class ViewModel {
  final List<ViewRowModel> rows;
  ViewModel.fromPresentation(PresenterModel model)
      : rows = model.rows.map((row) => ViewRowModel.fromPresentation(row)).toList();
}
