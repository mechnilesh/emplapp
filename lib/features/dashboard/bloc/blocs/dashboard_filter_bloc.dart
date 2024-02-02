import 'package:employee/features/dashboard/bloc/events/dashboard_filtered_event.dart';
import 'package:employee/features/dashboard/bloc/repository/dashboard_filtered_repository.dart';

import 'package:employee/features/dashboard/bloc/states/dashboard_filtered_state.dart';
import 'package:employee/features/dashboard/model/employee_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardFilterdBloc
    extends Bloc<DashboardFilteredEvent, DashboardFilterState> {
  DashboardFilterdBloc() : super(DashboardFilterInitialState()) {
    on<DashboardFilteredEventInitial>(
      (event, emit) => initialFilterList(event, emit),
    );

    on<DashboardFilteredEventbyFilter>(
      (event, emit) => filterEmployeeListByFilterValue(event, emit),
    );

    on<DashboardFilterByAge>(
      (event, emit) => filterEmployeeListByAge(event, emit),
    );
  }
  List<EmployeeData> initialEmployeeData = [];
  List<EmployeeData> filteredAgeEmployeeData = [];

  final DashboardFilteredRepository _repo = DashboardFilteredRepository();

  initialFilterList(
      DashboardFilteredEventInitial event, Emitter<DashboardFilterState> emit) {
    initialEmployeeData = event.employeeData;
    emit(DashboardFilteredState(event.employeeData));
  }

  filterEmployeeListByFilterValue(DashboardFilteredEventbyFilter event,
      Emitter<DashboardFilterState> emit) {
    if (event.filter.isNotEmpty) {
      List<EmployeeData> filteredList =
          _repo.filteredListByString(event.filter, initialEmployeeData);
      emit(DashboardFilteredState(filteredList));
    } else {
      emit(DashboardFilteredState(filteredAgeEmployeeData));
    }
  }

  filterEmployeeListByAge(
      DashboardFilterByAge event, Emitter<DashboardFilterState> emit) {
    emit(DashboardFilteredState(initialEmployeeData));

    List<EmployeeData> filteredList =
        _repo.filteredListByAge(event.ages, initialEmployeeData);
    filteredAgeEmployeeData = filteredList;
    emit(DashboardFilteredState(filteredList));
  }
}
