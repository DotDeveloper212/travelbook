class Activite {
  String nom;
  String description;
  double vote;
  String image;
  double prix;
  Activite({this.description, this.nom, this.image, this.prix, this.vote});
}

List<Activite> activites = [
  Activite(
    nom: 'Basilique de St.Mark',
    description: 'Tour touristique',
    vote: 2.0,
    image: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-540x360/06/6b/74/cf.jpg',
    prix: 30
  ),
  Activite(
    nom: 'Visite à pied en gondole',
    description: 'Tour de natation',
    vote: 3.0,
    image: 'https://img.rezdy.com/PRODUCT_IMAGE/18829/venice_gondolas_750x450__kavalenkava_lg.jpg',
    prix: 310
  ),
  Activite(
    nom: 'Tour de Murano & Burano',
    description: 'Visite shopping',
    image: 'https://media.tacdn.com/media/attractions-splice-spp-674x446/07/98/b8/9c.jpg',
    vote: 4.0,
    prix: 125
  ),
];
