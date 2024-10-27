class Category {
  final String catName;
  final String catImageUrl;

  Category({
    required this.catName,
    required this.catImageUrl,
  });
}

final List<Category> railCategories = [
  Category(
    catName: 'Packaging Machines',
    catImageUrl:
        'https://www.nichrome.com/images/V10/machines/large/Sprint_250_Plus_Multihead_Weigher.jpg',
  ),
  Category(
    catName: 'Packaging Systems',
    catImageUrl:
        'https://www.nichrome.com/images/2022/08/Warehousing-2.jpg',
  ),
  Category(
    catName: 'Filler Systems',
    catImageUrl:
        'https://www.nichrome.com/images/V10/machines/large/Intelligent_MHW.jpg',
  ),
];



/*---------------- Packaging machines Category Items --------------------*/

final List<Category> packagingmachines = [
  Category(
    catName: 'DH Wing Servo Auger Filler',
    catImageUrl:
        'https://www.nichrome.com/images/V10/machines/large/High_Speed_Double_Head_Wing_machine.jpg',
  ),
  Category(
    catName: 'Wing Sickpack',
    catImageUrl:
        'https://www.nichrome.com/images/V10/machines/large/Wing-Stickpack.jpg',
  ),
  Category(
    catName: 'Maxima 200',
    catImageUrl:
        'https://www.nichrome.com/images/V10/machines/large/Maxima_200.jpg',
  ),
  Category(
    catName: 'Maxima 400',
    catImageUrl:
        'https://www.nichrome.com/images/V10/machines/large/MAXIMA_400.jpg',
  ),
  Category(
    catName: 'SaltPack',
    catImageUrl:
        'https://www.nichrome.com/images/V10/machines/large/Salt_Pack_Plus.jpg',
  ),
  Category(
    catName: 'Sprint 250 Plus Servo Auger',
    catImageUrl:
        'https://www.nichrome.com/images/V10/machines/large/Sprint_250_Plus_Servo_Auger.jpg',
  ),
  Category(
    catName: 'Sprint 250 Plus Cup Filler',
    catImageUrl:
        'https://www.nichrome.com/images/V10/machines/large/Sprint_250_Plus_Servo_Auger.jpg',
  ),
  Category(
    catName: 'Sprint 250 Snack Pack',
    catImageUrl:
        'https://www.nichrome.com/images/V10/machines/large/Sprint_Snack_Pack.jpg',
  ),
  Category(
    catName: 'Excel 400 Plus Servo Auger',
    catImageUrl:
    'https://www.nichrome.com/images/V10/machines/large/Excel_Plus_Servo_Auger.jpg',
  ),
  Category(
    catName: 'Sprint 250 Plus Servo Auger',
    catImageUrl:
    'https://www.nichrome.com/images/V10/machines/large/Sprint_250_Plus_Servo_Auger.jpg',
  ),
  Category(
    catName: 'Maxima 200 with Servo Auger',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/large/Maxima_200.jpg',
  ),
  Category(
    catName: 'Maxima 400 with Servo Auger',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/large/MAXIMA_400.jpg',
  ),
  Category(
    catName: 'Sprint 250 Snack Pack',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/large/Sprint_Snack_Pack.jpg',
  ),
  Category(
    catName: 'Wing 200 E-Line Snack Pack',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/large/Wing-200-(e-line).jpg',
  ),
  Category(
    catName: 'Excel 400 Plus Intelligent Electronic Weigh Filler',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/large/Excel_Plus_Intelligent_Electronic_Weigh_Filler.jpg',
  ),
  Category(
    catName: 'Excel 400 Plus Cup Filler',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/large/Excel_Plus_Cup_Filler.jpg',
  ),
  Category(
    catName: 'Sprint 250 Plus Cup Filler',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/large/Sprint_250_Plus_Cup_Filler.jpg',
  ),
  Category(
    catName: 'Excel VertiPack 320',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/large/Vertipack-320.jpg',
  ),
  Category(
    catName: 'Sprint 250 Plus Intelligent Electronic Weigh Filler',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/large/Sprint_250_Plus_Intelligent_Electronic_Weigh_Filler.jpg',
  ),
  Category(
    catName: 'T-110',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/HFFS/T110-New.jpg',
  ),
  Category(
    catName: 'T-140',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/HFFS/T140-new.jpg',
  ),
  Category(
    catName: 'T-170',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/HFFS/T170-New.jpg',
  ),
  Category(
    catName: 'Pick Fill Seal Machine',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/large/Pick_Fill_Seal_Macnine.jpg',
  ),
  Category(
    catName: 'Prodo-Pack PV-215',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/large/Prodopack-PV215.jpg',
  ),
  Category(
    catName: 'Multilane Stickpack',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/large/Multilane_Stickpack_with_Servo_Auger_Filler.jpg',
  ),
  Category(
    catName: 'FILPACK SERVO 6K',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/large/Filpack_Servo_6K.jpg',
  ),
  Category(
    catName: 'Filpack Servo 12K',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/large/Filpack_Servo_12K.jpg',
  ),
  Category(
    catName: 'Filpack Servo Universal',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/large/Filpack_Servo_Universal.jpg',
  ),
  Category(
    catName: 'Filpack CMD ALPHA',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/large/Filpack-CMD-.Alpha.jpg',
  ),
  Category(
    catName: 'Filpack CMS 5L',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/large/Filpack_CMS_5L.jpg',
  ),
  Category(
    catName: 'FILPACK SERVO SMD',
    catImageUrl: 'https://www.nichrome.com/images/V10/machines/large/Filpack_Servo_SMD.jpg',
  ),

];

/*------------------ Packaging Systems Items ------------------*/

final List<Category> packgingsystems = [
  Category(
    catName: 'Product Handling',
    catImageUrl:
        'https://www.nichrome.com/images/2022/06/product-handling-2.jpg',
  ),
  Category(
    catName: 'Primary Packaging',
    catImageUrl:
        'https://www.nichrome.com/images/2022/04/packaging-systems/Primary-Packaging.jpg',
  ),
  Category(
    catName: 'Secondary Packaging',
    catImageUrl:
        'https://www.nichrome.com/images/2022/06/secondary-packaging/Secondary-packaging-img.jpg',
  ),
  Category(
    catName: 'End of Line Packaging',
    catImageUrl:
        'https://www.nichrome.com/images/2022/06/palletization/palletization-small.jpg',
  ),
  Category(
    catName: 'Warehousing',
    catImageUrl:
        'https://www.nichrome.com/images/2022/08/Warehousing.jpg',
  ),
  Category(
    catName: 'Track and Trace',
    catImageUrl:
        'https://www.nichrome.com/images/2022/08/track-and-trace-solutions.jpg',
  ),
  Category(
    catName: 'Industry Specific Solutions',
    catImageUrl:
        'https://www.nichrome.com/images/2022/08/industry/Tea-Packaging-System.jpg',
  ),
];

/*------------------ Filler Systems Items ------------------*/

final List<Category> fillersystems = [
  Category(
    catName: 'Intelweigh Multi Head Weigher 10H/14H',
    catImageUrl: 'https://www.nichrome.com/images/V6/Filling-systems/Intelligent_MHW_2.jpg',
  ),
  Category(
    catName: 'Intelweigh Combi Filler DH',
    catImageUrl:
        'https://www.nichrome.com/images/V6/Filling-systems/Intelligent_Weigh_Filler_Combi_2.jpg',
  ),
  Category(
    catName: 'Easyfill Servo Auger',
    catImageUrl:
        'https://www.nichrome.com/images/V6/Filling-systems/Easyfill_servo_auger_2.jpg',
  ),
];


