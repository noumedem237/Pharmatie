import 'dart:convert';

class UserModels {
  final String idUtilisateur;
  final String emailUtilisateur;
  final String grade;
  final String nomUtilisateurMobile;
  final String prenomUtilisateurMobile;
  final String numTel;
  UserModels({
    this.idUtilisateur,
    this.emailUtilisateur,
    this.grade,
    this.nomUtilisateurMobile,
    this.prenomUtilisateurMobile,
    this.numTel,
  });

  UserModels copyWith({
    String idUtilisateur,
    String emailUtilisateur,
    String grade,
    String nomUtilisateurMobile,
    String prenomUtilisateurMobile,
    String numTel,
  }) {
    return UserModels(
      idUtilisateur: idUtilisateur ?? this.idUtilisateur,
      emailUtilisateur: emailUtilisateur ?? this.emailUtilisateur,
      grade: grade ?? this.grade,
      nomUtilisateurMobile: nomUtilisateurMobile ?? this.nomUtilisateurMobile,
      prenomUtilisateurMobile:
          prenomUtilisateurMobile ?? this.prenomUtilisateurMobile,
      numTel: numTel ?? this.numTel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idUtilisateur': idUtilisateur,
      ' emailUtilisateur': emailUtilisateur,
      'grade': grade,
      'nomUtilisateurMobile': nomUtilisateurMobile,
      'prenomUtilisateurMobile': prenomUtilisateurMobile,
      'numTel': numTel,
    };
  }

  factory UserModels.fromMap(Map<String, dynamic> map) {
    return UserModels(
      idUtilisateur: map['idUtilisateur'],
      emailUtilisateur: map[' emailUtilisateur'],
      grade: map['grade'],
      nomUtilisateurMobile: map['nomUtilisateurMobile'],
      prenomUtilisateurMobile: map['prenomUtilisateurMobile'],
      numTel: map['numTel'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModels.fromJson(String source) =>
      UserModels.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModels(idUtilisateur: $idUtilisateur,  emailUtilisateur: $emailUtilisateur, grade: $grade, nomUtilisateurMobile: $nomUtilisateurMobile, prenomUtilisateurMobile: $prenomUtilisateurMobile, numTel: $numTel)';
  }
}
