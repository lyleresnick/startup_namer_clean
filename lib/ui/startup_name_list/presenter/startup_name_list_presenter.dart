import 'package:flutter/material.dart';
import 'package:startup_namer_clean/ui/startup_name_list/router/startup_name_list_router.dart';
import 'package:startup_namer_clean/ui/startup_name_list/presenter/startup_name_list_view_model.dart';
import 'package:startup_namer_clean/ui/common/starter_bloc.dart';
import 'package:startup_namer_clean/ui/startup_name_list/use_case/startup_name_list_presenter_model.dart';
import 'package:startup_namer_clean/ui/startup_name_list/use_case/startup_name_list_use_case_output.dart';
import 'package:startup_namer_clean/ui/startup_name_list/use_case/startup_name_list_use_case.dart';

import 'startup_name_list_presenter_output.dart';

class StartupNameListPresenter
    with StarterBloc<StartupNameListPresenterOutput> {
  final StartupNameListUseCase _useCase;
  final StartupNameListRouter _router;
  final scrollController = ScrollController();
  PresenterModel _cachedPresenterModel;

  StartupNameListPresenter(this._useCase, this._router) {
    _useCase.stream.listen((event) {
      if (event is PresentLoading) {
        streamAdd(ShowLoading());
      } else if (event is PresentModel) {
        _cachedPresenterModel = event.model;
        streamAdd(
            ShowModel(ViewModel.fromPresentation(event.model)));
      } else {
        assert(false, "unknown event $event");
        return null;
      }
    });
  }

  void eventGenerateSuggestions() {
    _useCase.eventGenerateSuggestions();
  }

  void eventToggle(int index) {
    final id = _cachedPresenterModel.rows[index].id;
    _useCase.eventToggle(id);
  }

  void eventShowFavorites() {
    _router.routeFavorites();
  }

  @override
  void dispose() {
    scrollController.dispose();
    _useCase.dispose();
    super.dispose();
  }
}
