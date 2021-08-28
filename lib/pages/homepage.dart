import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todey/main.dart';
import 'package:todey/model/todo.dart';
import 'package:todey/pages/edit_todo_page.dart';
import 'package:todey/provider/todosProvider.dart';
import 'package:todey/widgets/TodoDialog.dart';
// import 'package:todey/widgets/TodoDialog.dart';
import 'package:todey/widgets/TodoFormWidget.dart';
import 'package:todey/widgets/completed_list_widget.dart';
import 'package:todey/widgets/todoListWidget.dart';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

// late TabController _tabController;

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(
  //     length: 2,
  //     vsync: this,
  //   );
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _tabController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        // elevation: 0.7,
        // bottom: new TabBar(
        //   indicatorColor: Colors.white,
        //   controller: _tabController,
        //   tabs: [
        //     Tab(
        //       icon: Icon(Icons.fact_check_outlined),
        //     ),
        //     Tab(
        //       icon: Icon(
        //         Icons.done,
        //         size: 28,
        //         // color: Theme.of(context).primaryColor,
        //       ),
        //     )
        //   ],
        // ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            label: 'Completed',
          ),
        ],
      ),
      body: tabs[selectedIndex],
      // TabBarView(
      //   controller: _tabController,
      //   children: [
      //     TodoPage(),
      //     CompletedPages(),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddTodoDialogWidget(),
          barrierDismissible: false,
        ),
        // _buildSheet(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.orangeAccent,
        child: Icon(Icons.add),
      ),
    );
  }

  // _buildSheet() {
  //   return showModalBottomSheet(
  //       enableDrag: false,
  //       // isDismissible: false,
  //       // backgroundColor: Colors.transparent,
  //       isScrollControlled: true,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(
  //           top: Radius.circular(20),
  //         ),
  //       ),
  //       context: context,
  //       builder: (_) => buildSheet());
  // }

  // Widget buildSheet() => Padding(
  //       padding: MediaQuery.of(context).viewInsets,
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Text(
  //               'Add Todo',
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 22,
  //               ),
  //             ),
  //             TodoFormWidget(
  //               onChangedTitle: (title) => setState(() {
  //                 this.title = title;
  //               }),
  //               onChangedDescription: (description) => setState(() {
  //                 this.description = description;
  //               }),
  //               onSavedTodo: addTodo,
  //             ),
  //           ],
  //         ),
  //       ),
  //     );

  //
}
