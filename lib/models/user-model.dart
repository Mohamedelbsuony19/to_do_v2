class taskModel {
  String id;
  String tittle;
  String descrption;
  int date;
  bool isDone;
  taskModel(
      {this.id = '',
      required this.tittle,
      required this.descrption,
      required this.date,
      this.isDone = false});

  Map<String,dynamic>toJson(){
    return {
      'id':id,
      'title':tittle,
      'des':descrption,
      'date':date,
      'isDone':isDone
    };
  }
  taskModel.fromJson(Map<String,dynamic>json):
      this (
        id: json['id'] as String,
        tittle: json['title'] as String,
        descrption: json['des'] as String,
        isDone: json['isDone'] as bool,
        date: json['date'] as int,
      );
}
