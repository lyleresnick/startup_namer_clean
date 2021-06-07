import 'package:flutter/foundation.dart';

class PresenterRowModel {
  final String startupName;

  PresenterRowModel(
      {@required this.startupName});
}

class PresenterModel {
    final List<PresenterRowModel> rows;
    PresenterModel({this.rows});
}