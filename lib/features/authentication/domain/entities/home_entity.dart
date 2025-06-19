class HomeEntity {
  final String id;
  final String title;
  final String description;

  HomeEntity({
    required this.id,
    required this.title,
    required this.description,
  });
}

extension HomeModelExtension on HomeEntity {
  HomeEntity toEntity() {
    return HomeEntity(
      id: id,
      title: title,
      description: description,
    );
  }
}