
import 'dart:convert';

import 'package:final_project1/core/app_theme.dart';
import 'package:final_project1/core/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../features/cases/presentation/pages/cases_display.dart';
import '../features/tasks/presentation/pages/week_tasks_display.dart';
import 'widgets/appBar_widget.dart';
import 'widgets/drawer/drawer_widget.dart';


class BasicScreen extends StatefulWidget {

  BasicScreen({Key? key}) : super(key: key);

  @override
  State<BasicScreen> createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  var listsearch=[];
/*
  Future getData ( )async{
    var url="http://10.0.2.2:8080/mobtech/search.php";
    var response=await http.get(url as Uri);
    var resonsebody=jsonDecode(response.body);
    for(int i=0;i<resonsebody.length;i++){
      listsearch.add(resonsebody[i]['name']);
    }print(listsearch);
  }
*//*
  @override
  void initState(){
   // getData();
    super.initState();
  }
*/
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          drawer: Drawer_Widget(),
          appBar: build_appBar(title: 'الصفحة الرئيسيّة',
            searchIcon:
            IconButton(onPressed: (){/*
              showSearch(context: context, delegate: DataSearch(list: listsearch),);*/},
                icon:Icon(Icons.search)),
            tabBar:  TabBar(
              tabs: [

                Tab(
                  child: Text("   القضايا   ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

                ),
                Tab(
                  child: Text("   المهام   ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

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
              build_Cases_Display(context),
              Stack(alignment:Alignment.bottomLeft,children: [build_Week_Tasks_Display(context),Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircleAvatar(backgroundColor: colorbar,child: IconButton(onPressed: (){}, icon:Icon(Icons.add,size: 30,color: colorIcon,)),radius: 30,),
              ),],),
            ],


          ),

          backgroundColor: Colors.grey[100],
        ),
      ),
    );
  }
}
