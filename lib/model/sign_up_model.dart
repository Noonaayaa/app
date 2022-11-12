class SignUpModel {

  SignUpModel({
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.password,
    required this.userName,
    required this.image,
    required this.idCardImage,
    required this.nationalId,
    required this.country,
    required this.city,
    required this.address,
    required this.birthdayDate,
  });

  final String first_name;
  final String last_name;
  final String email;
  final String password;
  final String userName;
  final String image;
  final String idCardImage;
  final String nationalId;
  final String country;
  final String city;
  final String address;
  final String birthdayDate;

  factory SignUpModel.fromMap(Map<String, dynamic> json) => SignUpModel(
    first_name: json["first_name"],
    last_name: json["last_name"],
    email: json["email"],
    password: json["password"],
    userName: json["user_name"],
    image: json["image"],
    idCardImage: json["id_card_image"],
    nationalId: json["national_id"],
    country: json["country"],
    city: json["city"],
    address: json["address"],
    birthdayDate: json["birthday_date"],
  );


  Map<String, dynamic> toMap() => {
    "firstname": first_name,
    "lastname": last_name,
    "email": email,
    "password": password,
    "user_name": userName,
    "image": image,
    "id_card_image": idCardImage,
    "national_id": nationalId,
    "country": country,
    "city": city,
    "address": address,
    "birthday_date": birthdayDate,
  };
}
