import 'dart:developer';

import 'package:employee/features/dashboard/bloc/events/dashboard_event.dart';
import 'package:employee/features/dashboard/bloc/repository/dashboard_repository.dart';
import 'package:employee/features/dashboard/bloc/states/dashboard_state.dart';
import 'package:employee/features/dashboard/model/employee_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitialState()) {
    on<FetchDashboardData>((event, emit) => onFetchDashboard(emit, event));
  }

  final DashboardRepository _repo = DashboardRepository();
  onFetchDashboard(
      Emitter<DashboardState> emit, FetchDashboardData event) async {
    try {
      emit(DashboardLoadingState());
      var value = await _repo.getEmployess();
      log("value $value");
      EmployeesModel model = EmployeesModel.fromMap(value);
      log(model.status);
      emit(DashboardLoadedState(model.employeeData ?? []));
    } catch (e) {
      log(e.toString());
      emit(DashboardErrorState(e.toString()));
    }
  }
}
