import 'dart:convert';

import 'package:final_project1/core/app_theme.dart';
import 'package:final_project1/core/util/shared_preferences.dart';
import 'package:final_project1/core/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../features/cases/new/ui/pages/cases_display.dart';

import '../features/search/ui/pages/search_build.dart';
import '../features/tasks/ui/pages/tasks_display.dart';
import '../features/tasks/ui/widgets/task_page.dart';
import '../router/app_router.dart';
import 'widgets/appBar_widget.dart';
import 'widgets/drawer/drawer_widget.dart';

class BasicScreen extends StatefulWidget {
  BasicScreen({Key? key}) : super(key: key);

  @override
  State<BasicScreen> createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  var listsearch = [];

/*
  Future getData ( )async{
    var url="http://10.0.2.2:8080/mobtech/search.php";
    var response=await http.get(url as Uri);
    var resonsebody=jsonDecode(response.body);
    for(int i=0;i<resonsebody.length;i++){
      listsearch.add(resonsebody[i]['name']);
    }print(listsearch);
  }
*/ /*
  @override
  void initState(){
   // getData();
    super.initState();
  }
*/

  var isUser = AppSharedPreference.isUser;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: isUser ? 2 : 3,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          drawer: Drawer_Widget(),
          appBar: build_appBar(
            title: 'الصفحة الرئيسيّة',
            context: context,
            searchIcon: IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: Searchbuild());
                },
                icon: const Icon(Icons.search)),
            tabBar:  TabBar(
              tabs: [
                const Tab(
                  child: Text(
                    "   القضايا   ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                if(!isUser)
                const Tab(
                  child: Text(
                    "   المهام   ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Tab(
                  child: Text(
                    "   مهامي   ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.grey,
              indicatorWeight: 3,
              indicatorColor: Colors.white,
            ),
          ),
          body: TabBarView(
            children: [
              const CaseDisplayfinal(),
              if (!isUser) TasksDisplay(),
              const TaskPage(),
            ],
          ),
          backgroundColor: Colors.grey[100],
        ),
      ),
    );
  }
}
