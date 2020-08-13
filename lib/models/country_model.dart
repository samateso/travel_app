
class Country {
  final int id;
  final String name;
  final String image;

  Country({this.id, this.name, this.image});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}