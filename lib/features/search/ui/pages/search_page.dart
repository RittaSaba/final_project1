
import 'package:final_project1/features/search/ui/pages/search_build.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fetch_user.dart';



class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  FetchUser _userList=FetchUser();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:Text( "userList",),
          actions: [
            IconButton(onPressed: (){
              showSearch(context: context, delegate: Searchbuild());
            }, icon: Icon(Icons.search))
          ],

        ),

      ),
    );
  }
}