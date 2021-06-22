part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class ChangeTabEvent extends DashboardEvent {
  final int page;
  ChangeTabEvent(this.page);
}
