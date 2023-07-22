class Datum {
  final String id;
  final String destinationName;
  final String description;
  final String location;
  final String map;
  final List<String> imageUrl;
  final String linkAr;

  Datum({
    required this.id,
    required this.destinationName,
    required this.description,
    required this.location,
    required this.map,
    required this.imageUrl,
    required this.linkAr,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'],
      destinationName: json['destinationName'],
      description: json['description'],
      location: json['location'],
      map: json['map'],
      imageUrl: List<String>.from(json['imageUrl']),
      linkAr: json['linkAr'],
    );
  }
}
