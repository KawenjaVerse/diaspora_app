import 'package:diaspora_app/NavBarScreens/ToDoScreens/Accomodation.dart';
import 'package:diaspora_app/NavBarScreens/ToDoScreens/attraction.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ToDoScreens/all_tab.dart';


class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              dividerColor: Colors.transparent,
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Color(0xFFFF5C23), // Bottom indicator
              labelColor: Color(0xFFFF5C23), // Selected text color
              unselectedLabelColor: Colors.grey,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Color(0xFFFF5C23), width: 2),
              ),
              tabs: const [
                Tab(text: "All"),
                Tab(text: "Attractions"),
                Tab(text: "Accommodation"),
                Tab(text: "Investments"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                AllTab(),
               AttractionTab(),
               Accomodation(),
                Center(child: Text('Investments Tab Content')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
