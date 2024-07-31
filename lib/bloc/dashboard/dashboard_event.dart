part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  final int tabIndex;
  const DashboardEvent(this.tabIndex);

  @override
  List<Object> get props => [tabIndex];
}

final class OnTabChange extends DashboardEvent {
  const OnTabChange(super.tabIndex);
}
