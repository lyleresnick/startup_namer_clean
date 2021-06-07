import 'package:flutter/material.dart';
import 'package:startup_namer_clean/ui/main_router/presenter/main_router_presenter.dart';
import 'package:startup_namer_clean/ui/common/bloc_provider.dart';
import 'package:startup_namer_clean/ui/main_router/presenter/main_router_presenter_output.dart';
import 'package:startup_namer_clean/ui/startup_name_favorite_list/assembly/startup_name_favorite_list_assembly.dart';
import 'package:startup_namer_clean/ui/startup_name_list/assembly/startup_name_list_assembly.dart';

class MainRouterScene extends StatelessWidget {
  final MainRouterPresenter _presenter;
  final navKey = GlobalKey<NavigatorState>();

  MainRouterScene(this._presenter) {
    _presenter.stream.listen((event) {
      if (event is ShowFavorites) {
        navKey.currentState.pushNamed(_routeNameFavorites);
      } else if (event is ShowPopFavorites) {
        navKey.currentState.pop();
      } else {
        assert(false, "unknown event $event");
        return null;
      }
    });
  }

  static const _routeNameRoot = "/";
  static const _routeNameFavorites = "favorites";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainRouterPresenter>(
        bloc: _presenter,
        child: Navigator(
          key: navKey,
          initialRoute: _routeNameRoot,
          onGenerateRoute: (RouteSettings settings) {
            WidgetBuilder builder;
            switch (settings.name) {
              case _routeNameRoot:
                builder = (_) => StartupNameListAssembly(_presenter).scene;
                break;
              case _routeNameFavorites:
                builder = (_) => StartupNameFavoriteListAssembly(_presenter).scene;
                break;
              default:
                assert(false, 'Invalid route: ${settings.name}');
            }
            return MaterialPageRoute(builder: builder, settings: settings);
          },
        ));
  }
}
