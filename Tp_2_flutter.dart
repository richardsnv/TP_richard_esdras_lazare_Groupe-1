import 'dart:convert';

// Classe Client
class Client {
  int id;
  String name;
  String category;

  // Constructeur
  Client({required this.id, required this.name, required this.category});

  // Méthode pour convertir un objet Client en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
    };
  }

  // Méthode pour créer un objet Client à partir d'un JSON
  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      name: json['name'],
      category: json['category'],
    );
  }

  // Affichage personnalisé
  @override
  String toString() {
    return 'Client { ID: $id, Nom: $name, Catégorie: $category }';
  }
}

void main() {
  // Étape 1 : Création de 10 catégories
  List<String> categories = [
    "Banque", "Technologie", "Commerce", "Santé", "Éducation",
    "Transport", "Divertissement", "Alimentation", "Mode", "Sport"
  ];

  // Étape 2 : Création d'une liste de noms pour les clients
  List<String> clientNames = [
    "Alice", "Bob", "Charlie", "Diana", "Ethan",
    "Fiona", "George", "Hannah", "Ian", "Jasmine"
  ];

  // Étape 3 : Création de 10 clients avec des catégories
  List<Client> clients = List.generate(clientNames.length, (index) {
    return Client(id: index + 1, name: clientNames[index], category: categories[index]);
  });

  // Affichage de la liste complète des clients
  print("Liste complète des clients :");
  clients.forEach((client) => print(client));

  // Étape 4 : Filtrer les clients par nom
  String filterByName = "Alice";
  List<Client> filteredByName = clients.where((client) => client.name == filterByName).toList();

  print("\nClients filtrés par nom ($filterByName) :");
  filteredByName.forEach((client) => print(client));

  // Étape 5 : Filtrer les clients par catégorie
  String filterByCategory = "Technologie";
  List<Client> filteredByCategory = clients.where((client) => client.category == filterByCategory).toList();

  print("\nClients filtrés par catégorie ($filterByCategory) :");
  filteredByCategory.forEach((client) => print(client));

  // Étape 6 : Convertir un client en JSON
  String clientJson = jsonEncode(clients[0].toJson());
  print("\nClient converti en JSON : $clientJson");

  // Étape 7 : Créer un client à partir d'un JSON
  Client newClient = Client.fromJson(jsonDecode(clientJson));
  print("\nClient recréé à partir du JSON : $newClient");
}
