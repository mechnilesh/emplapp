import 'package:employee/features/dashboard/bloc/blocs/dashboard_filter_bloc.dart';
import 'package:employee/features/dashboard/bloc/events/dashboard_filtered_event.dart';
import 'package:employee/features/dashboard/bloc/states/dashboard_filtered_state.dart';
import 'package:employee/features/dashboard/components/employee_list_item.dart';
import 'package:employee/features/dashboard/model/employee_model.dart';
import 'package:employee/shared/widgets/k_textfield_widget.dart';
import 'package:employee/utils/extension_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key, required this.employeeList});
  final List<EmployeeData> employeeList;

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this, initialIndex: 0);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<DashboardFilterdBloc>()
          .add(DashboardFilteredEventInitial(widget.employeeList));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardFilterdBloc, DashboardFilterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                CustomTextField(
                  hintText: "Name,age,Salary",
                  onChanged: (value) {
                    context
                        .read<DashboardFilterdBloc>()
                        .add(DashboardFilteredEventbyFilter(value));
                  },
                  validator: (value) {},
                  obscureText: false,
                  labelText: "Search",
                ),
                SizedBox(
                  height: 50,
                  child: TabBar(
                    isScrollable: true,
                    physics: const BouncingScrollPhysics(),
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        text: "All",
                      ),
                      Tab(
                        text: "20-30",
                      ),
                      Tab(
                        text: "31-40",
                      ),
                      Tab(
                        text: "41-50",
                      ),
                      Tab(
                        text: "51-60",
                      ),
                      Tab(
                        text: "61-70",
                      ),
                      Tab(
                        text: "71-80",
                      ),
                      Tab(
                        text: "81-90",
                      ),
                    ],
                    onTap: (index) {
                      context
                          .read<DashboardFilterdBloc>()
                          .add(DashboardFilterByAge(index.range));
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: TabBarView(controller: _tabController, children: [
                  ...List.generate(8, (index) {
                    if (state is DashboardFilteredState) {
                      return state.employeeData.isEmpty
                          ? const Center(
                              child: Text("No Data Found"),
                            )
                          : ListView.builder(
                              itemCount: state.employeeData.length,
                              itemBuilder: (context, index) {
                                EmployeeData data = state.employeeData[index];
                                return EmployeeListItem(data: data);
                              });
                    }
                    return Text("Tab $index");
                  }),
                ])),
              ],
            ),
          );
        });
  }
}
