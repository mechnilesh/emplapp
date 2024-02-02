import 'package:employee/features/dashboard/model/employee_model.dart';

class DashboardFilteredRepository {
  List<EmployeeData> filteredListByString(
      String filter, List<EmployeeData> employeeData) {
    var lowerCaseFilter = filter.toLowerCase();
    var filteredEmployees = employeeData
        .where((employee) =>
            employee.employeeName.toLowerCase().contains(lowerCaseFilter) ||
            employee.employeeAge.toString().contains(lowerCaseFilter) ||
            employee.employeeSalary.toString().contains(lowerCaseFilter))
        .toList();
    return filteredEmployees;
  }

  List<EmployeeData> filteredListByAge(
      List<int> ages, List<EmployeeData> employeeData) {
    //if ages =[31-40]
    var filteredEmployees = employeeData
        .where((employee) =>
            employee.employeeAge >= ages.first &&
            employee.employeeAge <= ages.last)
        .toList();
    return filteredEmployees;
  }
}
