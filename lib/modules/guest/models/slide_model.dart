class SlideModel {
  String title;
  String subtitle;
  String image;
  String indicatorImage;

  // Constructor with named parameters
  SlideModel(
      {required this.title,
      required this.subtitle,
      required this.image,
      required this.indicatorImage});

  // Factory method for creating a SlideModel from a JSON map
  factory SlideModel.fromJson(Map<String, dynamic> json) {
    return SlideModel(
        title: json['title'] ?? '', // Default to empty string if null
        subtitle: json['subtitle'] ?? '',
        image: json['image'] ?? '',
        indicatorImage: json['indicator_image'] ?? '');
  }

  // Method for converting SlideModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'indicator_image': indicatorImage,
      'image': image
    };
  }
}
