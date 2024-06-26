part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent(this.tabIndex);

  final int tabIndex;

  @override
  List<Object> get props => [tabIndex];
}

final class ChangeTabEvent extends DashboardEvent {
  const ChangeTabEvent(super.tabIndex);
}
