/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;*/
/*
class DataSearch extends SearchDelegate<String>{
  List<dynamic >list;
  DataSearch({required this.list});
  Future getsearchdata() async{
    var url="http://10.0.2.2:8080/mobtech/searchmob.php";
    var data={"searchmobile":query};
    var response=await http.post(url as Uri,body:data);
    var responsebody=jsonDecode(response.body);
    return responsebody;
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    // Action for AppBar
   return [IconButton(onPressed: (){
     query="";
   }, icon: Icon(Icons.clear),),];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Icon leading
    return IconButton(onPressed: (){
      close(context,"");
    }, icon: Icon(Icons.arrow_back),);
  }

  @override
  Widget buildResults(BuildContext context) {

    // Results search
    return FutureBuilder(builder: (BuildContext context,AsyncSnapshot snapshot){
      if(snapshot.hasData){
        return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (context,i){return null;});
      }
      return Center(child: CircularProgressIndicator()) ;
    },future: getsearchdata(),);
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    // شخص ما يبحث عن شيء ما
    var ssearchList=query.isEmpty?list:list.where((P)=>P.startsWith(query) ).toList();
   return ListView.builder(itemCount: ssearchList.length,itemBuilder: (context,i){
     return ListTile(leading: Icon(Icons.mobile_screen_share),title: Text(ssearchList[i]),onTap: (){
       query=ssearchList[i];
       showResults(context);});
   });
  }

}*/