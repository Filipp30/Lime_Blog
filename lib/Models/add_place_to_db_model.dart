
class AddPlaceToDbModel{

  final String userName = 'Lime Test User';
  final String title;
  final String description;
  final String imageUrl = 'https://placeimg.com/640/480/any';
  final String locationName;

  const AddPlaceToDbModel({
    required this.title,
    required this.description,
    required this.locationName,
  });
}