import 'dart:async';

import 'bloc.dart';

abstract class StarterBloc<Output> implements Bloc<Output> {
  final _controller = StreamController<Output>();

  Stream<Output> get stream => _controller.stream;
  void streamAdd(Output value) => _controller.sink.add(value);

  bool get isClosed {
    return _controller.isClosed;
  }

  @override
  void dispose() {
    _controller.close();
  }
}
