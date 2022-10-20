class ProduitModels {
  int indexProduit;
  String nomProduit;
  String petiteDescription;
  String descriptionComplete;
  String prixProduit;
  String categorieProduit;
  String imageProduit;
  List disponibilite;

  ProduitModels(
      {this.indexProduit,
      this.nomProduit,
      this.imageProduit,
      this.petiteDescription,
      this.descriptionComplete,
      this.prixProduit,
      this.categorieProduit,
      this.disponibilite});

  ProduitModels.map(dynamic obj) {
    this.indexProduit = obj['indexProduit'];
    this.nomProduit = obj['nomProduit'];
    this.petiteDescription = obj['petiteDescription'];
    this.descriptionComplete = obj['descriptionComplete'];
    this.prixProduit = obj['prixProduit'];
    this.categorieProduit = obj['categorieProduit'];
    this.disponibilite = obj['disponibilite'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['indexProduit'] = indexProduit;
    map['nomProduit'] = nomProduit;
    map['petiteDescription'] = petiteDescription;
    map['descriptionComplete'] = descriptionComplete;
    map['prixProduit'] = prixProduit;
    map['categorieProduit'] = categorieProduit;
    map['disponibilite'] = disponibilite;
    return map;
  }

  ProduitModels.formMap(Map<String, dynamic> obj) {
    this.indexProduit = obj['indexProduit'];
    this.nomProduit = obj['nomProduit'];
    this.petiteDescription = obj['petiteDescription'];
    this.descriptionComplete = obj['descriptionComplete'];
    this.prixProduit = obj['prixProduit'];
    this.categorieProduit = obj['categorieProduit'];
    this.disponibilite = obj['disponibilite'];
  }
}
