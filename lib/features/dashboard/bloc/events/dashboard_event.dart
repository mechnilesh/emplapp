import 'package:flutter/material.dart';

@immutable
abstract class DashboardEvent {}

class DashboardInitial extends DashboardEvent {}

class FetchDashboardData extends DashboardEvent {}
