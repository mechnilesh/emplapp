// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EmployeesModel {
  String status;
  List<EmployeeData>? employeeData;
  String message;

  EmployeesModel({
    required this.status,
    required this.employeeData,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'data': employeeData?.map((x) => x.toMap()).toList(),
      'message': message,
    };
  }

  factory EmployeesModel.fromMap(Map<String, dynamic> map) {
    return EmployeesModel(
      status: map['status'],
      employeeData: map['data'] == null
          ? null
          : List<EmployeeData>.from(
              map['data'].map(
                (x) => EmployeeData.fromMap(x),
              ),
            ),
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeesModel.fromJson(String source) =>
      EmployeesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class EmployeeData {
  int id;
  String employeeName;
  int employeeSalary;
  int employeeAge;
  String profileImage;

  EmployeeData({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.profileImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'employee_name': employeeName,
      'employee_salary': employeeSalary,
      'employee_age': employeeAge,
      'profile_image': profileImage,
    };
  }

  factory EmployeeData.fromMap(Map<String, dynamic> map) {
    return EmployeeData(
      id: map['id'],
      employeeName: map['employee_name'],
      employeeSalary: map['employee_salary'],
      employeeAge: map['employee_age'],
      profileImage: map['profile_image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeData.fromJson(String source) =>
      EmployeeData.fromMap(json.decode(source) as Map<String, dynamic>);
}
