class Horizontal {
  late String name;
  late String date;
  late String features;
  String? image;

  Horizontal({
    required this.name,
    required this.date,
    required this.features,
    this.image,
  });

  factory Horizontal.fromJson(Map<String, dynamic> json) => Horizontal(
      name: json['name'], date: json['date'], features: json['features']);
}
