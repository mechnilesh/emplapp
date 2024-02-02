import 'package:employee/features/dashboard/model/employee_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class DashboardFilteredEvent {}

class DashboardFilteredEventInitial extends DashboardFilteredEvent {
  final List<EmployeeData> employeeData;
  DashboardFilteredEventInitial(this.employeeData);
}

class DashboardFilteredEventbyFilter extends DashboardFilteredEvent {
  final String filter;

  DashboardFilteredEventbyFilter(this.filter);
}

class DashboardFilterByAge extends DashboardFilteredEvent {
  final List<int> ages;

  DashboardFilterByAge(this.ages);
}
