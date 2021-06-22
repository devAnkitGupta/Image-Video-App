import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial());

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    switch (event.runtimeType) {
      case ChangeTabEvent:
        yield* _mapChangeIndexToState(event as ChangeTabEvent);
        break;
    }
  }

  Stream<DashboardState> _mapChangeIndexToState(ChangeTabEvent event) async* {
    yield DashboardPageChangedState(event.page);
  }
}

