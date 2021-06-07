import 'package:flutter/foundation.dart';
import 'package:startup_namer_clean/ui/startup_name_list/use_case/startup_name_list_presenter_model.dart';

class ViewRowModel {
  final String startupName;
  final bool isFavorite;

  ViewRowModel.fromPresentation(PresenterRowModel row)
      : startupName = row.startupName,
        isFavorite = row.isFavorite;
}

class ViewModel {
  final List<ViewRowModel> rows;
  ViewModel.fromPresentation(PresenterModel model)
      : rows = model.rows.map((row) => ViewRowModel.fromPresentation(row)).toList();
}
