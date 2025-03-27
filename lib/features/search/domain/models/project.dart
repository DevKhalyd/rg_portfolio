/// A project to be shown in my portfolio (Images part)
class Project {
  const Project({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.reference,
  });

  final String title, subtitle, imageUrl;

  /// Reference to find this project
  final String reference;
}
