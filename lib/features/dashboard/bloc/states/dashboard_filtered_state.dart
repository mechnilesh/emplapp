import 'package:employee/features/dashboard/model/employee_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class DashboardFilterState {}

class DashboardFilterInitialState extends DashboardFilterState {}

class DashboardFilteredState extends DashboardFilterState {
  DashboardFilteredState(this.employeeData);
  List<EmployeeData> employeeData;

  DashboardFilteredState copyWith(List<EmployeeData>? employeeData) {
    return DashboardFilteredState(employeeData ?? this.employeeData);
  }
}
