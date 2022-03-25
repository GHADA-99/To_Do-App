//data class with 2 function to use with converter

class Todo{
  static const String collectionName='Todo tasks';
  String id;
  String title;
  String description;
  DateTime date;
  bool isDone;
  Todo({required this.id,required this.title,required this.description,required this.date,this.isDone=false});
  //
  Todo.fromJson(Map<String, Object?> json)
      : this(
    id: json['id']! as String,
    title: json['title']! as String,
    description:json['description']! as String,
    date: DateTime.fromMillisecondsSinceEpoch(json['date']as int),
    isDone:json['isDone']! as bool,
  );
  Map<String,Object?> toJson(){
    return{
      'id':id,
      'title':title,
      'description':description,
      'date':date.millisecondsSinceEpoch,
      'isDone':isDone
    };
  }

}
