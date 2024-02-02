import 'package:employee/features/auth/bloc/blocs/auth_bloc.dart';
import 'package:employee/features/dashboard/bloc/blocs/dashboard_bloc.dart';
import 'package:employee/features/dashboard/bloc/blocs/dashboard_filter_bloc.dart';
import 'package:employee/routes/route_names.dart';
import 'package:employee/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          lazy: false,
          create: (context) => AuthBloc(
            context,
          ),
        ),
        BlocProvider<DashboardBloc>(
            lazy: true, create: (context) => DashboardBloc()),
        BlocProvider<DashboardFilterdBloc>(
          lazy: true,
          create: (context) => DashboardFilterdBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Employees',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: RouteNames.login,
        onGenerateRoute: Routes.materialPageRoute,
      ),
    );
  }
}
