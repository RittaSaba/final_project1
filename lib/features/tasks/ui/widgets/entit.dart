


class Entit{
  int id;
  String title;
  String note;
  int? isCompleted;
  String? data;
  String? startTime;
  String? endTime;
  int? color;
  int? remind;
  String ?repeat;

  Entit({
    required this.id,
    required this.title,
    required this.note,
    this.isCompleted,
    this.data,
    this.startTime,
    this.endTime,
    this.color,
    this.remind,
    this.repeat,
  });
/*  TaskD.fromJson(Map<String,dynamic>json){
    id=json['id'];
    title=json['title'];
    note=json['note'];
    isCompleted=json['isCompleted'];
    data=json['data'];
    startTime=json['startTime'];
    endTime=json['endTime'];
    color=json['color'];
    remind=json['remind'];
    repeat=json['repeat'];


  }

  Map<String,dynamic>toJson(){
    Map<String,dynamic>data=new Map<String,dynamic>();
    data['id']=this.id;
    data['title']=this.title;
    data['note']= this.note;
    data['isCompleted']=this.isCompleted;
    data['data']=this.data;
    data['startTime']=this.startTime;
    data['endTime']= this.endTime;
    data['color']= this.color;
    data['remind']=this.remind;
    data['repeat']= this.repeat;
    return data;
  }*/

}