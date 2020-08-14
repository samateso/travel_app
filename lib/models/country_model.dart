
class Country {
  final int id;
  final String name;
  final String image;
  final String description;

  Country({this.id, this.name, this.image, this.description});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description']
    );
  }
}