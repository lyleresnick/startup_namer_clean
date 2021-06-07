import 'package:flutter/material.dart';
import 'package:startup_namer_clean/ui/startup_name_favorite_list/assembly/startup_name_favorite_list_assembly.dart';
import 'package:startup_namer_clean/ui/startup_name_list/presenter/startup_name_list_presenter.dart';
import 'package:startup_namer_clean/ui/startup_name_list/presenter/startup_name_list_presenter_output.dart';
import 'package:startup_namer_clean/ui/startup_name_list/presenter/startup_name_list_view_model.dart';
import 'package:startup_namer_clean/ui/common/bloc_builder.dart';
import 'package:startup_namer_clean/ui/common/bloc_provider.dart';
import 'package:startup_namer_clean/ui/common/constants.dart';

class StartupNameListScene extends StatelessWidget {
  final StartupNameListPresenter _presenter;

  StartupNameListScene(this._presenter) {
    _presenter.scrollController.addListener(() {
      if (_isScrolledToBottom) {
        _presenter.eventGenerateSuggestions();
      }
    });
  }

  bool get _isScrolledToBottom =>
      _presenter.scrollController.position.maxScrollExtent <=
      _presenter.scrollController.position.pixels;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartupNameListPresenter,
            StartupNameListPresenterOutput>(
        bloc: _presenter,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          final data = snapshot.data;
          if (data is ShowLoading) {
            return Container(child: Center(child: CircularProgressIndicator()));
          } else if (data is ShowModel) {
            final viewModel = data.model;

            return Scaffold(
                appBar: AppBar(
                  title: Text('Startup Name Generator (Clean)'),
                  actions: [
                    IconButton(
                        icon: Icon(Icons.list),
                        onPressed: () => _showFavorites(context)),
                  ],
                ),
                body: ListView.builder(
                    controller: _presenter.scrollController,
                    padding: EdgeInsets.all(16.0),
                    itemCount: viewModel.rows.length,
                    itemBuilder: (context, i) {
                      return _StartUpNameRow(
                          viewModelRow: viewModel.rows[i], index: i);
                    }));
          }
        });
  }

  void _showFavorites(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return StartupNameFavoriteListAssembly().scene;
    }));
  }
}

class _StartUpNameRow extends StatelessWidget {
  final ViewRowModel viewModelRow;
  final int index;
  _StartUpNameRow({this.viewModelRow, this.index});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<StartupNameListPresenter>(context);

    return Column(
      children: [
        if (index > 0) Divider(),
        ListTile(
            title: Text(
              viewModelRow.startupName,
              style: Constants.biggerFont,
            ),
            trailing: Icon(
              viewModelRow.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: viewModelRow.isFavorite ? Colors.red : null,
            ),
            onTap: () {
              bloc.eventToggle(index);
            })
      ],
    );
  }
}
