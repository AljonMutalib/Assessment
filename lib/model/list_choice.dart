class ChoiceModel{
  final int id;
  final String image;
  final String date;
  final String status;
  

  ChoiceModel({this.id,this.image,this.date,this.status});

  Map<String,dynamic> toMap(){ // used when inserting data to the database
    return <String,dynamic>{
      "id" : id,
      "image" : image,
      "date" : date,
      "status" : status,
    };
  }
}