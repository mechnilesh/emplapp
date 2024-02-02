import 'package:employee/features/dashboard/bloc/blocs/dashboard_bloc.dart';
import 'package:employee/features/dashboard/bloc/events/dashboard_event.dart';
import 'package:employee/features/dashboard/bloc/states/dashboard_state.dart';
import 'package:employee/features/dashboard/screens/employee_list_screen.dart';
import 'package:employee/shared/widgets/k_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DashboardBloc>().add(FetchDashboardData());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is DashboardLoadedState) {}
      },
      builder: (context, state) {
        if (state is DashboardLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
        if (state is DashboardErrorState) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        if (state is DashboardLoadedState) {
          return EmployeeListScreen(
            employeeList: state.employeeData,
          );
        }
        return const SizedBox();
      },
    ));
  }
}
