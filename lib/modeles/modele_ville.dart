class ModeleVille {
  String nom;
  String pays;
  String image;
  String description;
  int activites;

  ModeleVille({this.nom, this.image, this.activites, this.pays, this.description});
}

List<ModeleVille> villes = [
  ModeleVille(
    nom: 'Venice',
    pays: 'Italie',
    activites: 120,
    description: 'Profitez du meilleur voyage pour un meilleur prix',
    image: 'https://www.telegraph.co.uk/content/dam/Travel/Destinations/Europe/Italy/Venice/venice-restaurants-2.jpg?imwidth=450',
  ),
  ModeleVille(
    nom: 'Paris',
    activites: 20,
    pays: 'France',
    description: 'Visiter la ville la plus populaire au monde',
    image: 'https://www.telegraph.co.uk/content/dam/Travel/2018/May/paris.jpg?imwidth=450',
  ),
  ModeleVille(
    nom: 'Phnom Penh',
    activites: 90,
    pays: 'Cambodia',
    description: 'Experience culturelle de Cambodia',
    image: 'https://s-ec.bstatic.com/images/hotel/max1024x768/187/187206953.jpg',
  ),
  ModeleVille(
    nom: 'Siem Reap',
    activites: 245,
    pays: 'Cambodia',
    description: 'Explorer l''ancien temple et le village culturel',
    image: 'https://img.traveltriangle.com/blog/wp-content/tr:w-700,h-400/uploads/2018/05/ta-prohm-Angkor-Thom-siem-reap.jpg',
  ),
];
