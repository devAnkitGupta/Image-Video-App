part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {
  final int index;

  DashboardState(this.index);
}

class DashboardInitial extends DashboardState {
  DashboardInitial() : super(0);
}

class DashboardPageChangedState extends DashboardState {
  final int index;
  DashboardPageChangedState(this.index) : super(index);
}
