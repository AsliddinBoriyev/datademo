class User{
  String id = '';
  String email = '';
  String password = '';
  String number = '';
  String address = '';

  User({required this.id, required this.email, required this.password});
  User.from({ required this.email, required this.password});
  User.account({ required this.email, required this.number, required this.address});
  User.fromJson(Map<dynamic, dynamic> json)
      :id = json['id'],
        email = json['email'],
        number = json['number'],
        address = json['address'],
        password= json['password'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'email' : email,
    'number' : number,
    'address' : address,
    'password' : password,
  };
}