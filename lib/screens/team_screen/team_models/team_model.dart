class TeamRModel {
  final String id;
  final String name;
  final String email;
  final String contact;
  final String address;
  final String imageBase64;
  final bool isRegistered;

  TeamRModel({
    required this.id,
    required this.name,
    required this.email,
    required this.contact,
    required this.address,
    required this.imageBase64,
    required this.isRegistered,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'contact': contact,
      'address': address,
      'imageBase64': imageBase64,
      'isRegistered': isRegistered,
    };
  }

  factory TeamRModel.fromMap(String id, Map<String, dynamic> map) {
    return TeamRModel(
      id: id,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      contact: map['contact'] ?? '',
      address: map['address'] ?? '',
      imageBase64: map['imageBase64'] ?? '',
      isRegistered: map['isRegistered'] ?? false,
    );
  }
}
