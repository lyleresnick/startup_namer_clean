import 'package:flutter/foundation.dart';

class PresenterRowModel {
  final int id;
  final String startupName;
  final bool isFavorite;

  PresenterRowModel(
      {@required this.id,
      @required this.startupName,
      @required this.isFavorite});
}

class PresenterModel {
  final List<PresenterRowModel> rows;
  PresenterModel(this.rows);
}
