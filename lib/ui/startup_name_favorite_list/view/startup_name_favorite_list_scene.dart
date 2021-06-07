import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer_clean/ui/common/bloc_builder.dart';
import 'package:startup_namer_clean/ui/common/constants.dart';
import 'package:startup_namer_clean/ui/startup_name_favorite_list/presenter/startup_name_favorite_list_presenter.dart';
import 'package:startup_namer_clean/ui/startup_name_favorite_list/presenter/startup_name_favorite_list_presenter_output.dart';

class StartupNameFavoriteListScene extends StatelessWidget {
  final StartupNameFavoriteListPresenter _presenter;
  StartupNameFavoriteListScene(this._presenter);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartupNameFavoriteListPresenter,
            StartupNameFavoriteListPresenterOutput>(
        bloc: _presenter,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          final data = snapshot.data;

          if (data is ShowLoading) {
            return Container(child: Center(child: CircularProgressIndicator()));
          } else if (data is ShowModel) {
            final viewModel = data.model;

            final tiles = viewModel.rows.map((favorite) => ListTile(
                  title: Text(
                    favorite.startupName,
                    style: Constants.biggerFont,
                  ),
                ));
            final divided = tiles.isNotEmpty
                ? ListTile.divideTiles(context: context, tiles: tiles).toList()
                : <Widget>[];

            return Scaffold(
              appBar: AppBar(
                title: Text('Favorites'),
              ),
              body: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: ListView(children: divided)),
                      Container(
                        child: FlatButton(
                          child: Text('Done', style: TextStyle(fontSize: 20,)),
                          onPressed: _presenter.eventDone,
                        ),
                        height: 40,
                      ),
                    ]),
              ),
            );
          }
        });
  }
}
