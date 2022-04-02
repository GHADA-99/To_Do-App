//data class with 2 function to use with converter

class Task{
  static const String collectionName='Todo tasks';
  String id;
  String title;
  String description;
  int date;  //hnt3aml b milliSecond
  bool isDone;
  Task({ this.id='',required this.title,required this.description,required this.date,this.isDone=false});

  Task.fromJson(Map<String, Object?> json)
      : this(
    id: json['id']! as String,
    title: json['title']! as String,
    description:json['description']! as String,
    date: json['date']as int,
    isDone:json['isDone']! as bool,
  );
  Map<String,Object?> toJson(){
    return{
      'id':id,
      'title':title,
      'description':description,
      'date':date,
      'isDone':isDone
    };
  }

}
