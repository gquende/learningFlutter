class Item {
  String title;
  bool done;
  
  Item({this.title, this.done});
  
  Item.fromJson(Map<String, dynamic> json) {
    title=json['title'];
    done=json['done'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data= new Map();
    data['title']=title;
    data['done']=done;
    return data;
  }

}