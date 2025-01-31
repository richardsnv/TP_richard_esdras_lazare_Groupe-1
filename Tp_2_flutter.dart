import 'dart:convert';

// Classe Clients
class Client {
  int id;
  String name;
  String category;

  Client({required this.id, required this.name, required this.category});


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
    };
  }

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      name: json['name'],
      category: json['category'],
    );
  }


  @override
  String toString() {
    return 'Client { ID: $id, Nom: $name, Catégorie: $category }';
  }
}

void main() {
 
  List<String> categories = [
    "Banque", "Technologie", "Commerce", "Santé", "Éducation",
    "Transport", "Divertissement", "Alimentation", "Mode", "Sport"
  ];

  
  List<String> clientNames = [
    "Alice", "Bob", "Charlie", "Diana", "Ethan",
    "Fiona", "George", "Hannah", "Ian", "Jasmine"
  ];


  List<Client> clients = List.generate(clientNames.length, (index) {
    return Client(id: index + 1, name: clientNames[index], category: categories[index]);
  });

  print("Liste complète des clients :");
  clients.forEach((client) => print(client));

  String filterByName = "Alice";
  List<Client> filteredByName = clients.where((client) => client.name == filterByName).toList();

  print("\nClients filtrés par nom ($filterByName) :");
  filteredByName.forEach((client) => print(client));

  String filterByCategory = "Technologie";
  List<Client> filteredByCategory = clients.where((client) => client.category == filterByCategory).toList();

  print("\nClients filtrés par catégorie ($filterByCategory) :");
  filteredByCategory.forEach((client) => print(client));

 
  String clientJson = jsonEncode(clients[0].toJson());
  print("\nClient converti en JSON : $clientJson");

  Client newClient = Client.fromJson(jsonDecode(clientJson));
  print("\nClient recréé à partir du JSON : $newClient");
}
