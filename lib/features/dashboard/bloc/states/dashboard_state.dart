import 'package:employee/features/dashboard/model/employee_model.dart';

abstract class DashboardState {}

class DashboardInitialState extends DashboardState {}

class DashboardLoadingState extends DashboardState {}

class DashboardErrorState extends DashboardState {
  final String errorMessage;

  DashboardErrorState(this.errorMessage);
}

class DashboardLoadedState extends DashboardState {
  final List<EmployeeData> employeeData;
  DashboardLoadedState(this.employeeData);
}
