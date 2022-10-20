import 'package:pharma/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Database db;

Future<void> initDatabase() async {
  var path = await getDatabasePath('e-pharma.db');
  db = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    var utilisateurmobile = """CREATE TABLE `utilisateurmobile` (
                `idUtilisateur` varchar(250) UNIQUE NOT NULL ,
                `e_mailUtilisateur` varchar(250) UNIQUE NOT NULL,
                `grade` varchar(50) UNIQUE NOT NULL,
                `nomUtilisateurMobile` varchar(50) UNIQUE NOT NULL,
                `prenomUtilisateurMobile` varchar(50) UNIQUE NOT NULL,
                `numTel` varchar(50) UNIQUE NOT NULL )""";
    await db.execute(utilisateurmobile);
    print("table user creer");
    var produit = """
        
CREATE TABLE `produitpharmaceutique` (
  `idProduitPharmaceutique` int(11) NOT NULL,
  `nomProduit` varchar(150) NOT NULL,
  `desPetiteProduitPharmaceutique` varchar(250) NOT NULL,
  `desCompleteProduitPharceutique` varchar(250) NOT NULL,
  `prixProduitPharmaceutique` varchar(250) NOT NULL,
  `categorieProduitPharmaceutique` varchar(70) NOT NULL,
  `imageProduitPharmaceutique` varchar(250) NOT NULL,
  `disponibiliteProduitPhar1` varchar(50) NOT NULL,
  `disponibiliteProduitPhar2` varchar(50) NOT NULL,
  `disponibiliteProduitPhar3` varchar(50) NOT NULL
);
    
    """;
    print("table produitpharmaceutique creer");
    await db.execute(produit);
  });
}

Future<String> getDatabasePath(String dbName) async {
  var dataPath = await getDatabasesPath();
  var path = join(dataPath, dbName);
  return path;
}

insertProduit() async {
  var query = """"
INSERT INTO `produitpharmaceutique` (`idProduitPharmaceutique`, `nomProduit`, `desPetiteProduitPharmaceutique`, `desCompleteProduitPharceutique`, `prixProduitPharmaceutique`, `categorieProduitPharmaceutique`, `imageProduitPharmaceutique`, `disponibiliteProduitPhar1`, `disponibiliteProduitPhar2`, `disponibiliteProduitPhar3`) VALUES
(152, 'OZAPRAL 30mg | 50mg', 'Ex quis do sint occaecat ut quis ut consequat tempor ad magna commodo deserunt sit.', 'Eu id incididunt sunt id cillum et reprehenderit minim ad voluptate excepteur. Esse consectetur laboris deserunt exercitation sint magna ut. Officia et non sint proident consectetur mollit amet anim proident laboris ullamco. Irure nostrud eu anim mag', '1 240 Fcfa', 'CP - Comprimé', 'assets/image/pro16.PNG', '0', '0', '0'),
(153, 'PEDIAKID NEZ-GORGE', 'Dégage les voies respiratoires - 125 ou 250ml', 'Laboris culpa dolore non aute aliqua exercitation amet officia laborum laborum sunt. Enim consectetur aliqua voluptate culpa do ipsum irure sint deserunt in non aliqua ad sit. Mollit ullamco amet do eiusmod sunt minim magna et. Do enim consectetur co', '1 950 Fcfa', 'BUV - Buvable', 'assets/image/pro3.PNG', '0', '0', '0'),
(154, 'Doctissimo TOTHEMA', 'Solution buvable boîte de 20 ampoules de 10 ml', 'Adipisicing adipisicing eu consequat exercitation. Dolore nostrud culpa ad adipisicing ipsum. Quis ut occaecat ullamco laborum nisi in veniam sunt esse laborum ipsum ullamco id. Excepteur veniam fugiat mollit veniam nulla cillum fugiat aliquip ea.', '22 775 Fcfa', 'Si - sirop', 'assets/image/pro7.PNG', '0', '0', '0'),
(155, 'BIMALARIL 20 | 40', 'Incididunt labore ex officia ipsum cillum sunt esse.', 'Reprehenderit deserunt mollit ipsum excepteur. Sint consequat velit magna veniam ad. Officia ea quis id est non occaecat consectetur voluptate voluptate nulla adipisicing dolore tempor. Dolor ullamco reprehenderit exercitation aute et cillum ullamco ', '993', 'BUV - Buvable', 'assets/image/pro4.PNG', '0', '0', '0'),
(156, 'HO-WARIA', 'Elit laboris consequat occaecat labore dolor in.', 'Irure elit sit elit esse magna ut magna est nisi laborum commodo commodo culpa ad. Consectetur ipsum sint duis officia voluptate laboris incididunt exercitation labore irure Lorem. Id dolore tempor Lorem eiusmod duis eu. Anim in enim id id dolore.', '3 812 Fcfa', 'COM - Comprimé', 'assets/image/pro6.PNG', '0', '0', '0'),
(157, 'TERMO LAZER', 'Duis magna sint Lorem ullamco minim velit veniam enim non minim ullamco ad veniam.', 'Ipsum voluptate nisi cupidatat officia ad adipisicing id eiusmod. Ullamco Lorem quis duis anim ad ad fugiat cupidatat nisi ex est ipsum adipisicing. Minim eu irure duis id excepteur in elit adipisicing aliquip do proident. Adipisicing ipsum commodo i', '2 000 Fcfa', 'appareil electronique', 'assets/image/pro5.PNG', '0', '0', '0'),
(158, 'ADRIDE M CP 2mg', 'Ex ex ut amet aliqua excepteur id voluptate laboris commodo ut laborum.', 'Commodo culpa fugiat veniam sunt duis occaecat proident dolor sit id mollit quis laborum. Excepteur enim pariatur Lorem id non commodo laborum ea laborum minim ex eu tempor magna. Pariatur ea velit aliquip ullamco minim magna irure laboris sunt eiusm', '3 042 Fcfa', 'CP - Comprimé', 'assets/image/pro8.PNG', '0', '0', '0'),
(159, 'ERYFLUID LOTION 4% F/10ML ARF', 'Consectetur incididunt deserunt fugiat elit consectetur sit nisi aute quis nisi labore in laborum.', 'Aliqua irure velit deserunt dolor fugiat elit cillum est occaecat dolor amet esse dolore. Ex minim amet pariatur fugiat pariatur id eu aliqua elit nisi. Deserunt fugiat do adipisicing qui proident. Laborum non ad excepteur duis fugiat irure cillum co', '4 552 Fcfa', 'SOL - Solution', 'assets/image/pro9.PNG', '0', '0', '0'),
(160, 'CACHE NEZ - ORZ', 'Do eu minim pariatur dolor enim amet esse consectetur cupidatat fugiat dolor excepteur ullamco.', 'Veniam sint nostrud cupidatat est mollit cupidatat. Magna aute amet officia laboris consequat cillum aliqua voluptate minim. Ut mollit ex pariatur anim Lorem ex consequat sunt. Non amet officia est do minim laboris laborum magna veniam est dolore mol', '150 Fcfa', 'MAS - Masque', 'assets/image/pro10.PNG', '0', '0', '0'),
(161, 'EFFERALGAN PARACETAMOL 250mg', 'Ea veniam ipsum amet nisi occaecat mollit duis.', 'Veniam aute quis quis voluptate magna nulla consectetur consectetur irure. Consequat amet excepteur magna amet incididunt ex duis ea aliquip do veniam ea laborum. Cillum fugiat deserunt proident commodo. In non exercitation qui minim consectetur sint', '1 500 Fcfa', 'BUV - Buvable', 'assets/image/pro11.PNG', '0', '0', '0'),
(162, 'EFFERALGAN MED 30mg/ml', 'Adipisicing ut officia sit veniam cupidatat commodo sint nostrud nisi cillum pariatur nulla.', 'Dolor mollit cupidatat velit nisi nisi Lorem. Voluptate enim est anim laborum sit dolore amet sit mollit. Laborum esse aliqua proident non sit aute fugiat nostrud do ullamco mollit occaecat ex. Aute aliquip pariatur fugiat anim. Ea nisi laborum deser', '1 700 Fcfa', 'B - Boite', 'assets/image/pro12.PNG', '0', '0', '0'),
(163, 'DOLIPRANE 1000mg', 'Consectetur nostrud laborum labore aliqua.', 'In ea id nulla eu elit. Labore aliquip cillum esse sunt exercitation Lorem pariatur culpa. Nostrud aliqua consequat deserunt incididunt minim dolore occaecat.', '850 Fcfa', 'CP - Comprimé', 'assets/image/pro13.PNG', '0', '0', '0'),
(164, 'OTRIVIN Adult', 'Ad occaecat irure sit eiusmod officia excepteur voluptate consequat cillum sit ut sunt esse.', 'Quis nostrud laborum deserunt commodo duis ipsum quis commodo esse anim. Dolor ex Lorem sint pariatur adipisicing ex adipisicing voluptate esse tempor. Velit consequat id reprehenderit velit do nisi Lorem sit eu deserunt cillum. Consequat eiusmod est', '1 000 Fcfa', 'Naz - Azale 10mL', 'assets/image/pro14.PNG', '0', '0', '0'),
(165, 'OXAGRAM - 8mL', 'Ad tempor do aute eiusmod esse sit occaecat quis aliqua proident in esse amet.', 'Excepteur aliqua Lorem ullamco commodo amet elit magna irure sit dolor consequat minim nisi. Aliquip tempor minim esse magna sit veniam minim voluptate excepteur cupidatat ipsum. Eiusmod labore amet nostrud tempor tempor voluptate nostrud consectetur', '6 242', 'CP - Comprimé', 'assets/image/pro15.PNG', '0', '0', '0'),
(166, 'OZAPRA 30 mg', 'Voluptate ad enim labore culpa velit sunt voluptate ullamco mollit eu.', 'Elit dolore ex in fugiat ex. Cupidatat magna eu et elit ut aliquip eu id consequat sunt voluptate magna dolore. Officia nisi consequat consequat id elit velit quis id aute tempor ex laboris minim.', '2 827 Fcfa', 'CP - Comprimé', 'assets/image/pro16.PNG', '0', '0', '0'),
(167, 'PANADO EXTRA', 'Veniam quis do ea velit ea voluptate ex non.', 'Excepteur proident anim magna id ex proident id cupidatat sint sunt eu excepteur. Do in nulla proident elit commodo. Laborum sint est minim anim non ea ex nulla commodo eu dolor.', '1 908 Fcfa', 'CP - Comprimé', 'assets/image/pro17.PNG', '0', '0', '0'),
(168, 'ENOXA 6000mg', 'Nostrud adipisicing incididunt laboris qui incididunt culpa ex.', 'Dolore consectetur exercitation et mollit duis do nulla. Irure irure consequat do nulla consectetur irure nisi proident sit aute cillum velit est non. Velit culpa proident mollit pariatur est aliqua qui do non nisi eu. Do adipisicing aliqua nostrud q', '12 991', 'IN - Injectable', 'assets/image/pro18.PNG', '0', '0', '0'),
(169, 'GILBERT EOSINE', 'Elit deserunt cillum ipsum nostrud eu magna velit nulla voluptate proident et cupidatat.', 'Consectetur excepteur amet aliquip mollit. Aliquip cupidatat elit voluptate exercitation veniam ut eu occaecat elit. Ullamco adipisicing nisi est amet voluptate laborum aute et. Nulla elit consectetur proident ullamco tempor elit consectetur. Volupta', '9 374 Fcfa', 'BUV - Buvable', 'assets/image/pro19.PNG', '0', '0', '0'),
(170, 'ERYTHROMYCIN 500mg', 'Laboris pariatur velit proident eiusmod nostrud.', 'Nulla deserunt veniam magna voluptate anim dolore nulla deserunt ut quis nulla. Nulla amet nostrud reprehenderit esse minim Lorem dolor. Occaecat cupidatat deserunt proident consequat.', '2 658 Fcfa', 'CP - Comprimé', 'assets/image/pro20.PNG', '0', '0', '0'),
(171, 'ERLUS - 5mg', 'Proident in eu ipsum nostrud commodo.', 'Esse officia eu in culpa ea. Ad dolor elit minim velit minim eu minim qui pariatur ad mollit dolore. Labore commodo in et cupidatat ullamco dolor aute ea officia occaecat.', '1 111 Fcfa', 'CP - Comprimé', 'assets/image/pro21.PNG', '0', '0', '0'),
(172, 'GILBERT - FLACON', 'Lorem dolor veniam incididunt nostrud sint ipsum ullamco excepteur.', 'Cillum fugiat proident velit ea veniam tempor quis id aliqua. Aute amet et enim duis occaecat ut veniam eiusmod consectetur pariatur. Enim officia quis in ullamco tempor consequat eu dolor officia consectetur. Nisi veniam sint proident culpa enim dol', '8 500 Fcfa', 'Buv - Buvable', 'assets/image/pro22.PNG', '0', '0', '0'),
(173, 'ESCODYNE', 'Id voluptate esse amet tempor est dolore nulla.', 'Proident elit dolor consequat labore laborum laborum enim reprehenderit aliqua pariatur. Culpa eiusmod magna deserunt occaecat magna. Sit irure culpa id ut adipisicing proident ad eiusmod in ea.', '850 Fcfa', 'BUV - Buvable', 'assets/image/pro23.PNG', '0', '0', '0'),
(174, 'FERTILO FORTE', 'Voluptate adipisicing proident commodo laboris Lorem officia labore ipsum ex.', 'Ex do id adipisicing Lorem cillum nulla magna voluptate do magna aliquip non. Est sunt consequat eiusmod aute. Nulla ut occaecat proident nisi officia. Sunt culpa consequat incididunt ut enim proident excepteur incididunt adipisicing velit laborum. I', 'NaN', 'NaN', 'assets/image/pro24.PNG', '0', '0', '0'),
(175, 'AKINETON 2mg', 'Commodo exercitation id ex culpa irure Lorem.', 'Enim laborum non ullamco do. Dolor tempor duis irure culpa pariatur. Sint voluptate ea ut occaecat proident eu Lorem consequat tempor fugiat cillum. Id dolore occaecat esse sit Lorem nostrud dolore ut commodo enim nulla Lorem mollit eiusmod. Irure co', '300 Fcfa', 'CP - Comprimé', 'assets/image/pro30.PNG', '0', '0', '0'),
(176, 'BEROCCA', 'Cillum mollit anim irure voluptate deserunt ex exercitation.', 'Magna commodo ut non consectetur. Non ullamco officia officia ut cupidatat anim sit enim consectetur. Aliquip irure magna commodo occaecat irure velit consectetur eu velit sunt in.', '15 750 Fcfa', 'BUV- Buvable', 'assets/image/pro25.PNG', '0', '0', '0'),
(177, 'MULTI VITAMINES', 'Labore qui fugiat irure irure cupidatat est reprehenderit dolor ut tempor.', 'Magna qui enim pariatur exercitation consectetur esse in Lorem amet velit ullamco est Lorem. Anim dolor occaecat pariatur adipisicing exercitation excepteur aliqua incididunt id. Cillum ipsum labore sunt aliqua cupidatat tempor consequat cupidatat qu', '800 Fcfa', 'CP - Comprimé', 'assets/image/pro26.PNG', '0', '0', '0'),
(178, 'MULTI VITAMINES 8 MINERAUX', 'Fugiat non mollit proident in excepteur est ex deserunt irure aute veniam magna aliquip.', 'Commodo id cillum aliqua enim nostrud ad duis sunt consectetur occaecat aliquip. Fugiat veniam laborum cillum enim excepteur ex. Laborum pariatur magna proident magna mollit quis aliqua adipisicing aliqua ad ut dolore. Id est commodo ex incididunt du', '1 151 Fcfa', 'CP - Comprimé', 'assets/image/pro27.PNG', '0', '0', '0'),
(179, '12 VITAMINES 7 OLIGO', 'ACTION GLOBALE Voluptate cupidatat laborum eiusmod sunt dolor ipsum anim tempor reprehenderit officia aute in.', 'Id officia quis do laborum dolor adipisicing laboris anim ipsum. Id exercitation eu duis enim anim elit. Proident nostrud nulla ea ex. Officia excepteur ea amet velit consequat aliqua sunt veniam minim labore ex. Ea ex est commodo mollit.', '8 055 Fcfa', 'BUV - Buvable', 'assets/image/pro28.PNG', '0', '0', '0'),
(180, 'CONA-ADIONE', 'Reprehenderit id ut mollit in cupidatat nisi culpa non elit.', 'Sit deserunt tempor laboris quis officia. Fugiat fugiat cupidatat incididunt duis et do irure ad qui tempor ea cupidatat Lorem amet. Veniam enim in ullamco officia et sit id nulla. Incididunt incididunt labore reprehenderit laborum aliqua minim offic', '12 350 Fcfa', 'COMP - Comprimé', 'assets/image/pro29.PNG', '0', '0', '0'),
(181, 'AKINETON 2mg', 'Culpa fugiat eu in ullamco irure sint est labore proident et ipsum adipisicing.', 'Elit eiusmod commodo quis nisi id et in duis deserunt commodo. Aliquip proident aute duis incididunt ut commodo occaecat est velit reprehenderit in adipisicing dolore fugiat. Ad nostrud culpa duis sunt. Amet mollit exercitation ipsum exercitation rep', '12 786 Fcfa', 'CP - Comprimé', 'assets/image/pro30.PNG', '0', '0', '0'),
(182, 'OZAPRAL 30mg | 50mg', 'Ex quis do sint occaecat ut quis ut consequat tempor ad magna commodo deserunt sit.', 'Eu id incididunt sunt id cillum et reprehenderit minim ad voluptate excepteur. Esse consectetur laboris deserunt exercitation sint magna ut. Officia et non sint proident consectetur mollit amet anim proident laboris ullamco. Irure nostrud eu anim mag', '1 240 Fcfa', 'CP - Comprimé', 'assets/image/pro16.PNG', '0', '0', '0'),
(183, 'PEDIAKID NEZ-GORGE ', 'Dégage les voies respiratoires - 125 ou 250ml', 'Laboris culpa dolore non aute aliqua exercitation amet officia laborum laborum sunt. Enim consectetur aliqua voluptate culpa do ipsum irure sint deserunt in non aliqua ad sit. Mollit ullamco amet do eiusmod sunt minim magna et. Do enim consectetur co', '1 950 Fcfa', 'BUV - Buvable', 'assets/image/pro3.PNG', '0', '0', '0'),
(184, 'Doctissimo TOTHEMA', 'Solution buvable boîte de 20 ampoules de 10 ml', '1111', '22 775 Fcfa', 'Adipisicing adipisicing eu consequat exercitation. Dolore nostrud culp', 'assets/image/pro7.PNG', '0', '0', '0'),
(185, 'BIMALARIL 20 | 40', 'Incididunt labore ex officia ipsum cillum sunt esse.', 'Reprehenderit deserunt mollit ipsum excepteur. Sint consequat velit magna veniam ad. Officia ea quis id est non occaecat consectetur voluptate voluptate nulla adipisicing dolore tempor. Dolor ullamco reprehenderit exercitation aute et cillum ullamco ', '993', 'BUV - Buvable', 'assets/image/pro4.PNG', '0', '0', '0'),
(186, 'HO-WARIA', 'Elit laboris consequat occaecat labore dolor in.', 'Irure elit sit elit esse magna ut magna est nisi laborum commodo commodo culpa ad. Consectetur ipsum sint duis officia voluptate laboris incididunt exercitation labore irure Lorem. Id dolore tempor Lorem eiusmod duis eu. Anim in enim id id dolore.', '3 812 Fcfa', 'COM - Comprimé', 'assets/image/pro6.PNG', '0', '0', '0'),
(187, 'TERMO LAZER', 'Duis magna sint Lorem ullamco minim velit veniam enim non minim ullamco ad veniam.', 'Ipsum voluptate nisi cupidatat officia ad adipisicing id eiusmod. Ullamco Lorem quis duis anim ad ad fugiat cupidatat nisi ex est ipsum adipisicing. Minim eu irure duis id excepteur in elit adipisicing aliquip do proident. Adipisicing ipsum commodo i', '2 000 Fcfa', 'appareil electronique', 'assets/image/pro5.PNG', '0', '0', '0'),
(188, 'ADRIDE M CP 2mg', 'Ex ex ut amet aliqua excepteur id voluptate laboris commodo ut laborum.', 'Commodo culpa fugiat veniam sunt duis occaecat proident dolor sit id mollit quis laborum. Excepteur enim pariatur Lorem id non commodo laborum ea laborum minim ex eu tempor magna. Pariatur ea velit aliquip ullamco minim magna irure laboris sunt eiusm', '3 042 Fcfa', 'CP - Comprimé', 'assets/image/pro8.PNG', '0', '0', '0'),
(189, 'ERYFLUID LOTION 4% F/10ML ARF', 'Consectetur incididunt deserunt fugiat elit consectetur sit nisi aute quis nisi labore in laborum.', 'Aliqua irure velit deserunt dolor fugiat elit cillum est occaecat dolor amet esse dolore. Ex minim amet pariatur fugiat pariatur id eu aliqua elit nisi. Deserunt fugiat do adipisicing qui proident. Laborum non ad excepteur duis fugiat irure cillum co', '4 552 Fcfa', 'SOL - Solution', 'assets/image/pro9.PNG', '0', '0', '0'),
(190, 'CACHE NEZ - ORZ', 'Do eu minim pariatur dolor enim amet esse consectetur cupidatat fugiat dolor excepteur ullamco.', 'Veniam sint nostrud cupidatat est mollit cupidatat. Magna aute amet officia laboris consequat cillum aliqua voluptate minim. Ut mollit ex pariatur anim Lorem ex consequat sunt. Non amet officia est do minim laboris laborum magna veniam est dolore mol', '150 Fcfa', 'MAS - Masque', 'assets/image/pro10.PNG', '0', '0', '0'),
(191, 'EFFERALGAN PARACETAMOL 250mg', 'Ea veniam ipsum amet nisi occaecat mollit duis.', 'Veniam aute quis quis voluptate magna nulla consectetur consectetur irure. Consequat amet excepteur magna amet incididunt ex duis ea aliquip do veniam ea laborum. Cillum fugiat deserunt proident commodo. In non exercitation qui minim consectetur sint', '1 500 Fcfa', 'BUV - Buvable', 'assets/image/pro11.PNG', '0', '0', '0'),
(192, 'EFFERALGAN MED 30mg/ml', 'Adipisicing ut officia sit veniam cupidatat commodo sint nostrud nisi cillum pariatur nulla.', 'Dolor mollit cupidatat velit nisi nisi Lorem. Voluptate enim est anim laborum sit dolore amet sit mollit. Laborum esse aliqua proident non sit aute fugiat nostrud do ullamco mollit occaecat ex. Aute aliquip pariatur fugiat anim. Ea nisi laborum deser', '1 700 Fcfa', 'B - Boite', 'assets/image/pro12.PNG', '0', '0', '0'),
(193, 'DOLIPRANE 1000mg', 'Consectetur nostrud laborum labore aliqua.', 'In ea id nulla eu elit. Labore aliquip cillum esse sunt exercitation Lorem pariatur culpa. Nostrud aliqua consequat deserunt incididunt minim dolore occaecat.', '850 Fcfa', 'CP - Comprimé', 'assets/image/pro13.PNG', '0', '0', '0'),
(194, 'OTRIVIN Adult', 'Ad occaecat irure sit eiusmod officia excepteur voluptate consequat cillum sit ut sunt esse.', 'Quis nostrud laborum deserunt commodo duis ipsum quis commodo esse anim. Dolor ex Lorem sint pariatur adipisicing ex adipisicing voluptate esse tempor. Velit consequat id reprehenderit velit do nisi Lorem sit eu deserunt cillum. Consequat eiusmod est', '1 000 Fcfa', 'Naz - Azale 10mL', 'assets/image/pro14.PNG', '0', '0', '0'),
(195, 'OXAGRAM - 8mL', 'Ad tempor do aute eiusmod esse sit occaecat quis aliqua proident in esse amet.', 'Excepteur aliqua Lorem ullamco commodo amet elit magna irure sit dolor consequat minim nisi. Aliquip tempor minim esse magna sit veniam minim voluptate excepteur cupidatat ipsum. Eiusmod labore amet nostrud tempor tempor voluptate nostrud consectetur', '6 242', 'CP - Comprimé', 'assets/image/pro15.PNG', '0', '0', '0'),
(196, 'OZAPRA 30 mg', 'Voluptate ad enim labore culpa velit sunt voluptate ullamco mollit eu.', 'Elit dolore ex in fugiat ex. Cupidatat magna eu et elit ut aliquip eu id consequat sunt voluptate magna dolore. Officia nisi consequat consequat id elit velit quis id aute tempor ex laboris minim.', '2 827 Fcfa', 'CP - Comprimé', 'assets/image/pro16.PNG', '0', '0', '0'),
(197, 'PANADO EXTRA', 'Veniam quis do ea velit ea voluptate ex non.', 'Excepteur proident anim magna id ex proident id cupidatat sint sunt eu excepteur. Do in nulla proident elit commodo. Laborum sint est minim anim non ea ex nulla commodo eu dolor.', '1 908 Fcfa', 'CP - Comprimé', 'assets/image/pro17.PNG', '0', '0', '0'),
(198, 'ENOXA 6000mg', 'Nostrud adipisicing incididunt laboris qui incididunt culpa ex.', 'Dolore consectetur exercitation et mollit duis do nulla. Irure irure consequat do nulla consectetur irure nisi proident sit aute cillum velit est non. Velit culpa proident mollit pariatur est aliqua qui do non nisi eu. Do adipisicing aliqua nostrud q', '12 991', 'IN - Injectable', 'assets/image/pro18.PNG', '0', '0', '0'),
(199, 'GILBERT EOSINE', 'Elit deserunt cillum ipsum nostrud eu magna velit nulla voluptate proident et cupidatat.', 'Consectetur excepteur amet aliquip mollit. Aliquip cupidatat elit voluptate exercitation veniam ut eu occaecat elit. Ullamco adipisicing nisi est amet voluptate laborum aute et. Nulla elit consectetur proident ullamco tempor elit consectetur. Volupta', '9 374 Fcfa', 'BUV - Buvable', 'assets/image/pro19.PNG', '0', '0', '0'),
(200, 'ERYTHROMYCIN 500mg', 'Laboris pariatur velit proident eiusmod nostrud.', 'Nulla deserunt veniam magna voluptate anim dolore nulla deserunt ut quis nulla. Nulla amet nostrud reprehenderit esse minim Lorem dolor. Occaecat cupidatat deserunt proident consequat.', '2 658 Fcfa', 'CP - Comprimé', 'assets/image/pro20.PNG', '0', '0', '0'),
(201, 'GILBERT - FLACON', 'Lorem dolor veniam incididunt nostrud sint ipsum ullamco excepteur.', 'Cillum fugiat proident velit ea veniam tempor quis id aliqua. Aute amet et enim duis occaecat ut veniam eiusmod consectetur pariatur. Enim officia quis in ullamco tempor consequat eu dolor officia consectetur. Nisi veniam sint proident culpa enim dol', '8 500 Fcfa', 'Buv - Buvable', 'assets/image/pro22.PNG', '0', '0', '0'),
(202, 'ESCODYNE', 'Id voluptate esse amet tempor est dolore nulla.', 'Proident elit dolor consequat labore laborum laborum enim reprehenderit aliqua pariatur. Culpa eiusmod magna deserunt occaecat magna. Sit irure culpa id ut adipisicing proident ad eiusmod in ea.', '850 Fcfa', 'BUV - Buvable', 'assets/image/pro23.PNG', '0', '0', '0'),
(203, 'ERLUS - 5mg', 'Proident in eu ipsum nostrud commodo.', 'Esse officia eu in culpa ea. Ad dolor elit minim velit minim eu minim qui pariatur ad mollit dolore. Labore commodo in et cupidatat ullamco dolor aute ea officia occaecat.', '1 111 Fcfa', 'CP - Comprimé', 'assets/image/pro21.PNG', '0', '0', '0'),
(204, 'GILBERT - FLACON', 'Lorem dolor veniam incididunt nostrud sint ipsum ullamco excepteur.', 'Cillum fugiat proident velit ea veniam tempor quis id aliqua. Aute amet et enim duis occaecat ut veniam eiusmod consectetur pariatur. Enim officia quis in ullamco tempor consequat eu dolor officia consectetur. Nisi veniam sint proident culpa enim dol', '8 500 Fcfa', 'Buv - Buvable', 'assets/image/pro22.PNG', '0', '0', '0'),
(205, 'AKINETON 2mg', 'Culpa fugiat eu in ullamco irure sint est labore proident et ipsum adipisicing.', 'Elit eiusmod commodo quis nisi id et in duis deserunt commodo. Aliquip proident aute duis incididunt ut commodo occaecat est velit reprehenderit in adipisicing dolore fugiat. Ad nostrud culpa duis sunt. Amet mollit exercitation ipsum exercitation rep', '12 786 Fcfa', 'CP - Comprimé', 'assets/image/pro30.PNG', '0', '0', '0'),
(206, 'ESCODYNE', 'Id voluptate esse amet tempor est dolore nulla.', 'Proident elit dolor consequat labore laborum laborum enim reprehenderit aliqua pariatur. Culpa eiusmod magna deserunt occaecat magna. Sit irure culpa id ut adipisicing proident ad eiusmod in ea.', '850 Fcfa', 'BUV - Buvable', 'assets/image/pro23.PNG', '0', '0', '0'),
(207, 'FERTILO FORTE', 'Voluptate adipisicing proident commodo laboris Lorem officia labore ipsum ex.', 'Ex do id adipisicing Lorem cillum nulla magna voluptate do magna aliquip non. Est sunt consequat eiusmod aute. Nulla ut occaecat proident nisi officia. Sunt culpa consequat incididunt ut enim proident excepteur incididunt adipisicing velit laborum. I', 'NaN', 'NaN', 'assets/image/pro24.PNG', '0', '0', '0'),
(208, 'AKINETON 2mg', 'Commodo exercitation id ex culpa irure Lorem.', 'Enim laborum non ullamco do. Dolor tempor duis irure culpa pariatur. Sint voluptate ea ut occaecat proident eu Lorem consequat tempor fugiat cillum. Id dolore occaecat esse sit Lorem nostrud dolore ut commodo enim nulla Lorem mollit eiusmod. Irure co', '300 Fcfa', 'CP - Comprimé', 'assets/image/pro30.PNG', '0', '0', '0'),
(209, 'CONA-ADIONE', 'Reprehenderit id ut mollit in cupidatat nisi culpa non elit.', 'Sit deserunt tempor laboris quis officia. Fugiat fugiat cupidatat incididunt duis et do irure ad qui tempor ea cupidatat Lorem amet. Veniam enim in ullamco officia et sit id nulla. Incididunt incididunt labore reprehenderit laborum aliqua minim offic', '12 350 Fcfa', 'COMP - Comprimé', 'assets/image/pro29.PNG', '0', '0', '0'),
(210, 'AKINETON 2mg', 'Culpa fugiat eu in ullamco irure sint est labore proident et ipsum adipisicing.', 'Elit eiusmod commodo quis nisi id et in duis deserunt commodo. Aliquip proident aute duis incididunt ut commodo occaecat est velit reprehenderit in adipisicing dolore fugiat. Ad nostrud culpa duis sunt. Amet mollit exercitation ipsum exercitation rep', '12 786 Fcfa', 'CP - Comprimé', 'assets/image/pro30.PNG', '0', '0', '0'),
(211, 'BEROCCA', 'Cillum mollit anim irure voluptate deserunt ex exercitation.', 'Magna commodo ut non consectetur. Non ullamco officia officia ut cupidatat anim sit enim consectetur. Aliquip irure magna commodo occaecat irure velit consectetur eu velit sunt in.', '15 750 Fcfa', 'BUV- Buvable', 'assets/image/pro25.PNG', '0', '0', '0'),
(212, 'MULTI VITAMINES', 'Labore qui fugiat irure irure cupidatat est reprehenderit dolor ut tempor.', 'Magna qui enim pariatur exercitation consectetur esse in Lorem amet velit ullamco est Lorem. Anim dolor occaecat pariatur adipisicing exercitation excepteur aliqua incididunt id. Cillum ipsum labore sunt aliqua cupidatat tempor consequat cupidatat qu', '800 Fcfa', 'CP - Comprimé', 'assets/image/pro26.PNG', '0', '0', '0'),
(213, 'CONA-ADIONE', 'Reprehenderit id ut mollit in cupidatat nisi culpa non elit.', 'Sit deserunt tempor laboris quis officia. Fugiat fugiat cupidatat incididunt duis et do irure ad qui tempor ea cupidatat Lorem amet. Veniam enim in ullamco officia et sit id nulla. Incididunt incididunt labore reprehenderit laborum aliqua minim offic', '12 350 Fcfa', 'COMP - Comprimé', 'assets/image/pro29.PNG', '0', '0', '0'),
(214, 'AKINETON 2mg', 'Culpa fugiat eu in ullamco irure sint est labore proident et ipsum adipisicing.', 'Elit eiusmod commodo quis nisi id et in duis deserunt commodo. Aliquip proident aute duis incididunt ut commodo occaecat est velit reprehenderit in adipisicing dolore fugiat. Ad nostrud culpa duis sunt. Amet mollit exercitation ipsum exercitation rep', '12 786 Fcfa', 'CP - Comprimé', 'assets/image/pro30.PNG', '0', '0', '0'),
(215, 'MULTI VITAMINES 8 MINERAUX', 'Fugiat non mollit proident in excepteur est ex deserunt irure aute veniam magna aliquip.', 'Commodo id cillum aliqua enim nostrud ad duis sunt consectetur occaecat aliquip. Fugiat veniam laborum cillum enim excepteur ex. Laborum pariatur magna proident magna mollit quis aliqua adipisicing aliqua ad ut dolore. Id est commodo ex incididunt du', '1 151 Fcfa', 'CP - Comprimé', 'assets/image/pro27.PNG', '0', '0', '0'),
(216, '12 VITAMINES 7 OLIGO', 'ACTION GLOBALE Voluptate cupidatat laborum eiusmod sunt dolor ipsum anim tempor reprehenderit officia aute in.', 'Id officia quis do laborum dolor adipisicing laboris anim ipsum. Id exercitation eu duis enim anim elit. Proident nostrud nulla ea ex. Officia excepteur ea amet velit consequat aliqua sunt veniam minim labore ex. Ea ex est commodo mollit.', '8 055 Fcfa', 'BUV - Buvable', 'assets/image/pro28.PNG', '0', '0', '0'),
(217, 'CONA-ADIONE', 'Reprehenderit id ut mollit in cupidatat nisi culpa non elit.', 'Sit deserunt tempor laboris quis officia. Fugiat fugiat cupidatat incididunt duis et do irure ad qui tempor ea cupidatat Lorem amet. Veniam enim in ullamco officia et sit id nulla. Incididunt incididunt labore reprehenderit laborum aliqua minim offic', '12 350 Fcfa', 'COMP - Comprimé', 'assets/image/pro29.PNG', '0', '0', '0'),
(218, 'AKINETON 2mg', 'Culpa fugiat eu in ullamco irure sint est labore proident et ipsum adipisicing.', 'Elit eiusmod commodo quis nisi id et in duis deserunt commodo. Aliquip proident aute duis incididunt ut commodo occaecat est velit reprehenderit in adipisicing dolore fugiat. Ad nostrud culpa duis sunt. Amet mollit exercitation ipsum exercitation rep', '12 786 Fcfa', 'CP - Comprimé', 'assets/image/pro30.PNG', '0', '0', '0');""";

  await db.execute(query);
  print("insertion effec");
}

// Utilisateurmobile //
//Inserstion utilisateurmobile
Future<int> saveNewUtilisateurmobile(UserModels newUtilisateurmobile) async {
  int res = await db.insert(
    "utilisateurmobile",
    newUtilisateurmobile.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return res;
}

//Get utilisateurmobile
Future<List> getItems() async {
  var result = await db.rawQuery("SELECT * FROM utilisateurmobile");
  return result.toList();
}

// Mise a jours
update(UserModels newUtilisateurmobile) async {
  var result = await db.update(
      "utilisateurmobile", newUtilisateurmobile.toMap(),
      where: "utilisateurmobile = ?",
      whereArgs: [newUtilisateurmobile.idUtilisateur]);
  return result;
}

// Suppression complet*
Future<int> deleteItem() async {
  return await db.delete("utilisateurmobile");
}
