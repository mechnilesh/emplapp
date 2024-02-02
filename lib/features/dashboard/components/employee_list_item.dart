import 'package:employee/features/dashboard/model/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeListItem extends StatelessWidget {
  const EmployeeListItem({
    super.key,
    required this.data,
  });

  final EmployeeData data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.employeeName),
      subtitle: Text(data.employeeSalary.toString()),
    );
  }
}
