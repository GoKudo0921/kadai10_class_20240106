class Account {
  String id;
  String name;
  String imagePath;
  String selfIntroduction;
  String userid;
  DateTime? createdTime;
  DateTime? updatedTime;

  Account({this.id = '', this.name = '', this.imagePath = '',
  this.selfIntroduction = '', this.userid = '', this.createdTime, this.updatedTime,});
}