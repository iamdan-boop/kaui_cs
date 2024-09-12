class Coffee {
  final int id;
  final String title;
  final String imagePath;
  final int amount;

  Coffee({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.amount,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      id: json['id'] as int,
      title: json['title'] as String,
      imagePath: json['imagePath'] as String,
      amount: json['amount'] as int,
    );
  }
}