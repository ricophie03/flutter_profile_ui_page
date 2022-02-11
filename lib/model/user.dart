class User {
  final String? imagePath;
  final String? name;
  final String? email;
  final String? about;
  final bool? isDarkMode;

  User({this.imagePath, this.name, this.about, this.email, this.isDarkMode});

  //Method Make a copy of User
  User copy(
      {String? imagePath,
      String? name,
      String? about,
      String? email,
      bool? isDarkMode}) {
    return User(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        about: about ?? this.about,
        isDarkMode: isDarkMode ?? this.isDarkMode);
  }

  // Method convert User to JSON
  Map<String, dynamic> toJson() {
    return {
      'imagePath':
          imagePath, // value ini diambil dan distore di method fromJson dibawah
      'name': name,
      'email': email,
      'about': about,
      'isDarkMode': isDarkMode
    };
  }

  // Method convert JSON to User
  static User fromJson(Map<String, dynamic> json) {
    return User(
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
        about: json['about'],
        isDarkMode: json['isDarkMode']);
  }
}
