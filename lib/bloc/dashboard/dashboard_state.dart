part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  const DashboardState(this.tabIndex);

  final int tabIndex;

  @override
  List<Object> get props => [tabIndex];
}

final class DashboardInitial extends DashboardState {
  const DashboardInitial(super.tabIndex);
}
