class User {
  final int id;
  final String name;
  Company company;

  User({
    required this.id,
    required this.name,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        company: Company.fromJson(json["company"]),
      );
}

class Company {
  final String name;

  const Company({
    required this.name,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
    );
  }
}
