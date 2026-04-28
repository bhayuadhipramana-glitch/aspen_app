class PlaceModel {
  final String name;
  final String imageUrl;
  final double rating;
  final bool isFavorite;
  final String? duration;
  final String description;
  final double price;

  PlaceModel({
    required this.name,
    required this.imageUrl,
    required this.rating,
    this.isFavorite = false,
    this.duration,
    required this.description,
    required this.price,
  });
}

class AppData {
  static List<String> categories = [
    'Location', 'Hotels', 'Food', 'Adventure', 'Activities',
  ];

  static List<PlaceModel> popularPlaces = [
    PlaceModel(
      name: 'Alley Palace',
      imageUrl: 'assets/images/alley.png', // Menggunakan gambar lokal
      rating: 4.1,
      isFavorite: true,
      description: 'Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining shopping and ....',
      price: 199,
    ),
    PlaceModel(
      name: 'Coeurdes Alpes',
      imageUrl: 'assets/images/coeurdes.png', // Menggunakan gambar lokal
      rating: 4.5,
      isFavorite: false,
      description: 'Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining shopping and ....',
      price: 299,
    ),
  ];

  static List<PlaceModel> recommendedPlaces = [
    PlaceModel(
      name: 'Explore Aspen',
      imageUrl: 'assets/images/explore.png', // Menggunakan gambar lokal
      rating: 4.3,
      duration: '4N/5D',
      description: 'Explore the beautiful city of Aspen with guided tours.',
      price: 399,
    ),
    PlaceModel(
      name: 'Luxurious Aspen',
      imageUrl: 'assets/images/luxurious.png', // Menggunakan gambar lokal
      rating: 4.7,
      duration: '2N/3D',
      description: 'Experience the luxurious side of Aspen with premium hotels.',
      price: 599,
    ),
  ];

  static List<Map<String, String>> facilities = [
    {'icon': 'wifi',   'label': '1 Heater'},
    {'icon': 'dinner', 'label': 'Dinner'},
    {'icon': 'tub',    'label': '1 Tub'},
    {'icon': 'pool',   'label': 'Pool'},
  ];
}