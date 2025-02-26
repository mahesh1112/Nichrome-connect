class Machine {
  final String name;
  final String imageUrl;
  final List<String> categories; // e.g., ["Packaging Machines", "Filling Systems"]
  final List<String> industries; // e.g., ["Food", "Pharma"]
  final String description; // Added description field
  final String videoUrl;
  final String pdfUrl;

  Machine({
    required this.name,
    required this.imageUrl,
    required this.categories,
    required this.industries,
    required this.description, // Initialize description
    required this.videoUrl,
    required this.pdfUrl,
  });
}

class MachineData {
  static List<Machine> allMachines = [
    Machine(
      name: 'Excel 400 Plus Servo Auger',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Excel_Plus_Servo_Auger.jpg',
      categories: ['Packaging Machines'],
      industries: ['Powders', 'Tea'],
      description: "The EXCEL PLUS series comes with a plus advantage of automation equipped with CE marked PLC Controller and touch screen HMI. Key features include print mark scanners, static charge eliminator, servo motor driven bag length control system, and adjustable stroke of cross sealing jaws for optimum performance. It is designed as per stringent quality standards, and can be easily integrated to upstream or downstream machines/systems.\n\nA range of fillers makes the EXCEL PLUS series a truly versatile packaging solution for powders, granules, grains, snacks, etc.",
      videoUrl: 'https://www.youtube.com/watch?v=7jYKBI__9Ck',
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Sprint 250 Plus Servo Auger',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Sprint_250_Plus_Servo_Auger.jpg',
      categories: ['Packaging Machines'],
      industries: ['Powders', 'Tea'],
      description: "For pouch quantities up to 2 Kgs, Nichrome’s SPRINT 250 PLUS series offers speed, accuracy and efficiency for flexible packaging of a wide variety of snacks, grains, powders, etc.\n\nSPRINT 250 PLUS is an automated machine with CE marked PLC and touch screen HMI. Its servo motor driven sealing system can effectively seal with pressure levels maintained. It is programmed to pull the exact length of film required for packaging, and offers a perforation system to deliver a chain of small pouches.",
      videoUrl: 'https://www.youtube.com/watch?v=n_4aTTNGytI',  ///nahi mila
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Maxima 200 with Servo Auger',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Maxima_200.jpg',
      categories: ['Packaging Machines'],
      industries: ['Powders', ''],
      description: "With a compact design, MAXIMA 200/400 has a small footprint to occupy less space in factories. A PLC-based control system and optional interface with PC & data processors make the MAXIMA 200/400 a favourite with powder manufacturers.\n\nAs the name suggests, the MAXIMA 200 packs up to 200 pouches/min. while the MAXIMA 400 packs up to 400 pouches/min. Single or perforated chain of pouches can be produced.\n\nThe MAXIMA 400 has flexibility to pack different products with different quantities on each head.",
      videoUrl: 'https://www.youtube.com/watch?v=n_4aTTNGytI',  ///nahi mila
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Maxima 400 with Servo Auger',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/MAXIMA_400.jpg',
      categories: ['Packaging Machines'],
      industries: ['Powders', ''],
      description: "With a compact design, MAXIMA 200/400 has a small footprint to occupy less space in factories. A PLC-based control system and optional interface with PC & data processors make the MAXIMA 200/400 a favourite with powder manufacturers.\n\nAs the name suggests, the MAXIMA 200 packs up to 200 pouches/min. while the MAXIMA 400 packs up to 400 pouches/min. Single or perforated chain of pouches can be produced.\n\nThe MAXIMA 400 has flexibility to pack different products with different quantities on each head.",
      videoUrl: 'https://www.youtube.com/watch?v=n_4aTTNGytI',  ///nahi mila
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Sprint 250 Snack Pack',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Sprint_Snack_Pack.jpg',
      categories: ['Packaging Machines'],
      industries: ['Namkeen', ''],
      description: "When it comes to snack packaging, Nichrome leads the way with its high-speed, accurate SPRINT SNACKPACK. Designed especially for the snack industry, SPRINT SNACKPACK is a food packaging machine that offers quick and easy tool-less changeover of size parts resulting in minimum product falling height.\n\nIt packs a wide variety of snacks and similar food products in pouch formats such as the CSPP, Gusset with D-cut and Gusset. The perforation system makes it possible to produce chain of small pouches. SPRINT SNACKPACK has HACCP & GMP compatible construction.",
      videoUrl: 'https://www.youtube.com/watch?v=NuV64nCrFA4',
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Wing 200 E-Line Snack Pack',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Wing-200-(e-line).jpg',
      categories: ['Packaging Machines'],
      industries: ['Grains', 'Namkeen'],
      description: 'Exclusive packaging solution for startups and small enterprises. \nDiscover all the superior expertise and reliability of Nichrome, in a compact, affordable format - designed to fit your space, budget and performance expectations. After all, as India’s leading packaging solutions provider, Nichrome understands your products and your needs.',
      videoUrl: 'https://www.youtube.com/watch?v=jTCBsA5qGJA',
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Excel 400 Plus Intelligent Electronic Weigh Filler',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Excel_Plus_Intelligent_Electronic_Weigh_Filler.jpg',
      categories: ['Packaging Machines'],
      industries: ['Grains','Sugar', 'Seeds','Tea'],
      description: 'The EXCEL PLUS series comes with a plus advantage of automation equipped with CE marked PLC Controller and touch screen HMI. Key features include print mark scanners, servo motor driven bag length control system, and adjustable stroke of cross sealing jaws for optimum performance. It is designed as per stringent quality standards, and can be easily integrated to upstream or downstream machines/systems.',
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Excel 400 Plus Cup Filler',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Excel_Plus_Cup_Filler.jpg',
      categories: ['Packaging Machines'],
      industries: ['Grains', 'Agrochemicals','Fertilizers'],
      description: 'The EXCEL PLUS series comes with a plus advantage of automation equipped with CE marked PLC Controller and touch screen HMI. Key features include print mark scanners, servo motor driven bag length control system, and adjustable stroke of cross sealing jaws for optimum performance. It is designed as per stringent quality standards, and can be easily integrated to upstream or downstream machines/systems.',
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Sprint 250 Plus Cup Filler',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Sprint_250_Plus_Cup_Filler.jpg',
      categories: ['Packaging Machines'],
      industries: ['Agrochemicals','Fertilizers'],
      description: "For pouch quantities up to 2 Kgs, Nichrome’s SPRINT 250 PLUS series offers speed, accuracy and efficiency for flexible packaging of a wide variety of snacks, grains, powders, etc.\n\nSPRINT 250 PLUS is an automated machine with CE marked PLC and touch screen HMI. Its servo motor driven sealing system can effectively seal with pressure levels maintained. It is programmed to pull the exact length of film required for packaging, and offers a perforation system to deliver a chain of small pouches.",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Excel VertiPack 320',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Vertipack-320.jpg',
      categories: ['Packaging Machines'],
      industries: ['Grains', 'Tea','Namkeen'],
      description: "Excel Vertipack 320 is India's first vertical pouch packaging machine! \nYet another versatile innovation from Nichrome, Excel Vertipack 320 has been developed for packaging dry fruits, snacks, pasta, grains, etc. in a variety of standup pouches with or without zipper. \nWith its high speed performance, sturdy design, online check weigher & metal detector, compatibility with multiple fillers, and a host of other features, Excel Vertipack 320 assures you robust performance with unmatched versatility",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Sprint 250 Plus Intelligent Electronic Weigh Filler',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Sprint_250_Plus_Intelligent_Electronic_Weigh_Filler.jpg',
      categories: ['Packaging Machines'],
      industries: ['Grains', 'Tea'],
      description: "For pouch quantities up to 2 Kgs, Nichrome’s SPRINT 250 PLUS series offers speed, accuracy and efficiency for flexible packaging of a wide variety of snacks, grains, powders, etc.\n SPRINT 250 PLUS is an automated machine with CE marked PLC and touch screen HMI. Its servo motor driven sealing system can effectively seal with pressure levels maintained. It is programmed to pull the exact length of film required for packaging, and offers a perforation system to deliver a chain of small pouches",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'T-110',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/HFFS/T110-New.jpg',
      categories: ['Packaging Machines'],
      industries: ['Grains', 'Oil','Milk','Sugar','Powders', 'Tea','Gel'],
      description: "Nichrome's HFFS packaging machines bring you new generation, linear technology from Europe. The Series is versatile, and can be used for packing a wide range of powders, grains, snacks, liquids and viscous products using different fillers. The Series also offers a range of pouch formats with superior pouch aesthetics.\n The HFFS machines are PLC based machines with touch screen interface. The compact and versatile design offers both single and perforated chain of pouches with quick and easy changeover. Well designed duplex modules are available for higher outputs",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'T-140',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/HFFS/T140-new.jpg',
      categories: ['Packaging Machines'],
      industries: ['Grains', 'Oil','Milk','Sugar','Powders', 'Tea','Gel'],
      description: "Nichrome's HFFS packaging machines bring you new gen, linear technology from Europe. The Series is versatile, and can be used for packing a wide range of powders, grains, snacks, liquids and viscous products using different fillers. The Series also offers a range of pouch formats with superior pouch aesthetics.\n The HFFS machines are PLC based machines with touch screen interface. The compact and versatile design offers both single and perforated chain of pouches with quick and easy changeover. Well designed duplex modules are available for higher outputs.",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'T-170',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/HFFS/T170-New.jpg',
      categories: ['Packaging Machines'],
      industries: ['Grains', 'Oil','Milk','Sugar','Powders','Tea','Gel'],
      description: "Nichrome's HFFS packaging machines bring you new gen, linear technology from Europe. The Series is versatile, and can be used for packing a wide range of powders, grains, snacks, liquids and viscous products using different fillers. The Series also offers a range of pouch formats with superior pouch aesthetics.\n  The HFFS machines are PLC based machines with touch screen interface. The compact and versatile design offers both single and perforated chain of pouches with quick and easy changeover. Well designed duplex modules are available for higher outputs.",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Pick Fill Seal Machine',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Pick_Fill_Seal_Macnine.jpg',
      categories: ['Packaging Machines'],
      industries: ['Grains', 'Oil','Milk','Sugar','Powders', 'Tea','Ready to eat'],
      description: "Get the combined benefits of variety, productivity and specialty packaging for ready-to-eat foods with Nichrome’s Pick-Fill-Seal machine. Using versatile Rotary technology, the machine conveniently packs a wide variety of ready-to-eat foods in eye-catching innovative shapes while maintaining freshness of the products. The machine is sturdy and compact, easy to clean and maintain.\n  An advanced variant of packaging technology innovated by Nichrome enables 2 or 3 different fillers to dispense multiple types of ingredients in the same pouch.",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Prodo-Pack PV-215',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Prodopack-PV215.jpg',
      categories: ['Packaging Machines'],
      industries: ['Grains', 'Oil','Milk','Sugar','Gel'],
      description: "These are high speed, flexible, PLC-controlled machines from Prodo-Pack, USA, a global leader in multilane technology. For practically every application in Pharma, Personal Care, Cosmetics, Healthcare and Food industries, PV-215’s intermittent motion technology ensures efficient sealing and a bagger speed of up to 1000 bags/min.\n  PV-215 is extremely flexible to accommodate quickly any attachments/additional features at any stage due to its shaft-mounted modular concept. It also offers wrinkle-free sealing and user-friendly web tracking.",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Multilane Stickpack with Multi Head Servo Auger Filler',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Multilane_Stickpack_with_Servo_Auger_Filler.jpg',
      categories: ['Packaging Machines'],
      industries: ['Powders', 'Tea','Oil','Gel'],
      description: "For producers supplying non-free flowing powders such as milk powders, coffee powder, tea/coffee premixes, etc. to food chains, travel and hospitality industries, Nichrome's STICKPACK offers unmatched efficiency.\n\nNichrome's MULTILANE STICKPACK with Servo Auger Filler is a stick pack pouch packaging machine equipped with a CE certified PLC controller that makes it easy to operate and provides the necessary flexibility for product and format changes while maintaining the efficiency of the process.",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Multilane Stickpack with Multi-Piston Filler',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Stickpack_with_Multi_Piston_Filler.jpg',
      categories: ['Packaging Machines'],
      industries: ['Gel'],
      description: "Nichrome's Multilane Stickpack with Multi-Piston Filler is a stick pack pouch packaging machine especially innovated for packing liquids and viscous products in convenient, single-serve stick packs.\n\nFor packaging liquids and viscous products such as honey, ketchup, mayonnaise, mustard paste, jam, shampoo, etc., Nichrome's STICKPACK offers a stainless steel structure, pneumatically operated piston filler and longitudinal & cross-sealing jaw assemblies suitable for laminates. A CE certified PLC controller makes it easy to operate.",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Multilane Stickpack With Volumetric Multiple Cavity Filler',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Multilane_Stickpack_with_Volumetric_Multiple_Cavity_Filler.jpg',
      categories: ['Packaging Machines'],
      industries: ['Gel'],
      description: "For producers supplying free flowing powders and granular products such as sugar, salt, pepper, mouth freshner, etc. to food chains, travel and hospitality industries, Nichrome's STICKPACK offers unmatched efficiency.\n\nNichrome's MULTILANE STICKPACK with Volumetric Multiple Cavity Filler is a stick pack pouch packaging machine equipped with a product hopper of 25 liters capacity approx. and a mesh at the product inlet to avoid entry of foreign particles. A CE certified PLC controller makes it easy to operate.",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),


    Machine(
      name: 'FILPACK SERVO 6K',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Filpack_Servo_6K.jpg',
      categories: ['Packaging Machines'],
      industries: ['Milk', ''],
      description: "This compact machine for packing Plain Milk, Flavored Milk, Lassi, Juice, Mineral Water, etc., is a heavy-duty performer, delivering accurate and well-sealed CSPP pouches at a speed of 6000 packs/hour.\n\nHygiene is crucial so the structure of the machine is in stainless steel or aluminium. Product contact parts are made of SS304, and the general design is maintenance-friendly and lubrication free.\n\nOptional accessories include insulated balance tanks for energy saving, SCADA system, automatic CIP system, automatic pouch counting &crating systems, and more",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Filpack Servo 12K',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Filpack_Servo_12K.jpg',
      categories: ['Packaging Machines'],
      industries: ['Milk', ''],
      description: "This machine is the fastest milk pouch packaging machine, with a speed of 12,000 packs/hour. It can pack CSPP pouches of 200 ml, 500 ml and 1000 ml with equal ease and accuracy.\n\nFILPACK SERVO 12K is a heavy duty machine with simple maintenance-friendly construction. It is built for hygiene with product contact parts of stainless steel and a UV film sterilisation system for the packaging material.\n\nIndependent balance tanks offer flexibility to handle single or different products simultaneously.",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Filpack Servo Universal',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Filpack_Servo_Universal.jpg',
      categories: ['Packaging Machines'],
      industries: ['Milk', ''],
      description: "Filpack Servo Universal is the nextgen solution for Dairy packaging. A high speed, versatile performer, FILPACK SERVO UNIVERSAL serves multiple applications in both free flowing liquid (milk, buttermilk, water, juicy drinks, etc.) and viscous (cream, ghee, mayonnaise, kefir, etc.).\n\nPack quantity ranges from 200 ml to 1000 ml, and output speed goes up to 5000 packs per hour.\n\nFilpack Servo Universal is also available in a Double Head Combo Filler model which enables customers to fill viscous products on one head and liquid on the other",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Filpack CMD ALPHA',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Filpack-CMD-.Alpha.jpg',
      categories: ['Packaging Machines'],
      industries: ['Milk', ''],
      description: "FILPACK CMD Alpha is another efficient packaging solution for milk and other liquids. Built substantially shorter than conventional machines, it also occupies less floor space as no side opening is required.\n\nThe impulse seal system is controlled through solid state control technology, and there is a specially designed film roll unwinding mechanism for smooth bag pulling.\n\nFILPACK CMD Alpha offers twin heads so you can pack two different products at the same time. You can even conduct maintenance on one track while the other is in operation.",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Filpack CMS 5L',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Filpack_CMS_5L.jpg',
      categories: ['Packaging Machines'],
      industries: ['Milk', 'Adhesives','Lube Oil'],
      description: "FILPACK CMS 5L is another high-speed member of the FILPACK Series. It is a more versatile machine, packaging both liquids and viscous products with a pneumatic filling system for better filling consistency. FILPACK CMS 5L fills and seals pouches of larger quantities - up to 5500 ml in CSPP format.\n\nLiquids are packed at a speed of 800 pouches/hour, while viscous products are packed at 400 pouches/hour.\n\nA robust, MS-painted fabricated body, enclosed SS cabinet and SS 304 product contact parts ensure hygienic, maintenance-friendly operations",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'FILPACK SERVO SMD',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Filpack_Servo_SMD.jpg',
      categories: ['Packaging Machines'],
      industries: ['Oil', 'Adhesives','Lube Oil'],
      description: "For packaging oil and other viscous products such as ghee, ketchup, fruit pulp, mayonnaise, curry pastes, and even grease, paint, adhesives, etc., FILPACK SERVO SMD spells peace of mind.\n\nFILPACK SERVO SMD is a durable, heavy-duty performer, with touch screen HMI panel and PLC that controls operations. It occupies less floor space and has an enclosed SS cabinet for hygienic operation.\n\nFILPACK SERVO SMD comes with twin head construction with independent head operation so you can pack two different products and quantities simultaneously",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),




    Machine(
      name: 'Bottle Filling Line',
      imageUrl: 'https://www.nichrome.com/images/2022/08/bottle-filling-line/Bottle-Filling-Line-Machine.jpg',
      categories: ['Packaging Systems'],
      industries: ['Grains','Tablets','Powders','Sugar','Milk','Tea','Oil','Ready to eat','Primary Packaging'],
      description: "Nichrome presents a versatile bottle filling line for liquids, powders, granules & solids. Applications range from milk, cleaning products, protein powder, spice powders, seasonings, pharma powders to pulses, grains, sugar, tea, tablets, dry fruits, soya chunks & whole spices. Just change the filler and use the filling line for any liquid, powder and solid application.\n The PLC-controlled system is fitted with a unique ‘no bottle no filling’ safety device, and safety enclosures with interlocks for rotary parts. It works well for glass, HDPE and PP bottles and offers fast changeover for different bottle sizes.",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Jar Filling Line',
      imageUrl: 'https://www.nichrome.com/images/2022/04/packaging-systems/Jar-Filing-Packaging-Machine.jpg',
      categories: ['Packaging Systems'],
      industries: ['Grains','Gel','Adhesives','Paint Powders','Sugar','Milk','Powders','Tea','Namkeen','Oil','Adhesives','Lube Oil','Primary Packaging'],
      description: "Nichrome presents a versatile jar filling & packaging system is widely used to fill solids like tea, small biscuits, nutraceutical powders, health drinks, wrapped candies, etc. viscous like ghee, peanut butter, mayonnaise, chyawanprash, etc. powders, granules, candies, biscuits, etc. into bottles and jars. We provide the complete solution for all kind of bottle filling, foil sealing, capping, labeling and batch coding requirement.The PLC-controlled system is fitted with a unique ‘no bottle no filling’ safety device, and safety enclosures with interlocks for rotary parts. It works well for glass, HDPE and PP bottles and offers fast changeover for different Jar sizes.",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Tin Filling Line',
      imageUrl: 'https://www.nichrome.com/images/2022/12/27/Tin-filling-Machine-large.jpg',
      categories: ['Packaging Systems'],
      industries: ['Oil','Gel', 'Milk','Powders','Lube Oil','Primary Packaging'],
      description: "Nichrome's TIN FILLING LINE is a sturdy, low-maintenance system made for accurate and efficient performance.\n\nThe PLC-controlled line has a digital LCD touch screen displaying settings, and safety enclosures with interlocks for rotary parts.\n\nMachine construction is available in SS3014, SS316 and MS painted material. Various tin sterilization and cleaning options are available",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Vertical Cartoner',
      imageUrl: 'https://www.nichrome.com/images/2022/06/secondary-packaging/vertical-cartoning/Vertical-Cartoning-Alpha-V12.jpg',
      categories: ['Packaging Systems'],
      industries: ['Grains','Tablets','Powders','Tea','Namkeen','Agrochemicals','Fertilizers','Gel','Secondary Packaging'],
      description: "Discover fast and efficient cartoning with Nichrome’s VERTICAL CARTONING MACHINE. This secondary packaging machine has a rated output of upto 120 cartons per minute, and handles a variety of cartons with option of both side tuck-in, both side gluing or top tuck-in with bottom gluing.\n  The machine structure is of MS sheet metal for durability. Some key features include adjustable carton conveyor with chain type design, servo indexing drive to carton and product chain, motorized carton pick up with vacuum cups, and facility for product insertion inside carton through motor-driven product pusher",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Horizontal Cartoner',
      imageUrl: 'https://www.nichrome.com/images/2022/07/Packaging-system/Horizontal-Cartoning-Machine.jpg',
      categories: ['Packaging Systems'],
      industries: ['Grains','Oil','Namkeen','Tablets','Capsules','Gel','Powders','Tea','Agrochemicals','Fertilizers','Gel','Secondary Packaging'],
      description: "Discover fast and efficient cartoning with Nichrome’s HORIZONTAL CARTONING MACHINE. This secondary packaging machine has a rated output of upto 180 cartons per minute, and handles a variety of cartons with option of both side tuck-in, both side gluing or top tuck-in with bottom gluing.\n  We offer both Continuous and Intermittent Fully automatic Horizontal Cartoners which we integrate with primary packaging.\n Features:\n Flexibility for size range and quick change-over system\n Additional positive product inserter before flap closure (special for rigid products & pouches)\n Auto pre-folded leaflet insertion\n Machine guards with positive safety interlocks\n Sensors for monitoring carton and pouch\n Speed up to 180 cartons per minute",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Case Erector',
      imageUrl: 'https://www.nichrome.com/images/2022/06/secondary-packaging/Case-erector/case-erector-machine.jpg',
      categories: ['Packaging Systems'],
      industries: ['Grains','Gel','Oil','Namkeen','Tablets','Capsules','Gel','Sugar','Milk','Powders', 'Tea','Agrochemicals','Fertilizers','Adhesives','Lube Oil','Secondary Packaging'],
      description: "Nichrome’s case erectors are reliable and designed to specifically address the usual problems in automatic erection of cases owing to the quality of the corrugated board and the imperfections in its forming process.\n A unique mechanism is incorporated in this machine to positively open the case irrespective of case quality and ensure squareness throughout the forming process.",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Automatic Pouch Collation & Flow Wrapping(Flexiwrap ST)',
      imageUrl: 'https://www.nichrome.com/images/2022/06/secondary-packaging/flexiwrap-st/Flexiwrap-ST-Machine-Large.jpg',
      categories: ['Packaging Systems'],
      industries: ['Grains','Powders', 'Tea','Agrochemicals','Fertilizers','Secondary Packaging'],
      description: "With Nichrome’s new Secondary Packaging Solution – Flexiwrap ST, you can integrate with existing form fill seal / FFS machine to collate/bundle and flow wrap individual pouches in to Distributor Packs / Retail Ready Packs.",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Flexiwrap 700: Flow Wrap Machine',
      imageUrl: 'https://www.nichrome.com/images/2022/06/secondary-packaging/Flexiwrap-700-Large.jpg',
      categories: ['Packaging Systems'],
      industries: ['Milk','Gel','Secondary Packaging', 'Sugar','Powders','Tea','Namkeen','Oil','Agrochemicals','Fertilizers','Adhesives'],
      description: "With the Flexiwrap 700, secondary CSPP Flow-wrapped pouches are formed for a wide range of layflat widths, upto 700mm.\n\nOperation is as follows:\n\tManual Product Feeding in to specialized conveyor\n\tAutomatic flow wrapping",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Pick & Place Solutions',
      imageUrl: 'https://www.nichrome.com/images/2023/07/17/Pick-and-pack.jpg',
      categories: ['Packaging Systems'],
      industries: ['Oil','Gel','Secondary Packaging', 'Sugar','Milk','Powders', 'Tea','Namkeen','Agrochemicals','Fertilizers','Adhesives','Lube Oil'],
      description: "Customised Pick & Place solutions for secondary packaging.\n\tRobotic\nGantry/ Mechanical\nSolutions Available for both:\n\tRigid Products\nFlexible Products",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Bulk Bag Filling',
      imageUrl: 'https://www.nichrome.com/images/2022/08/Bulk-bag-filling/Bulk-Bag-Filling-Machine-02.jpg',
      categories: ['Packaging Systems'],
      industries: ['Agrochemicals','Fertilizers','Primary Packaging'],
      description: "The new BULK PACKING MACHINE from Nichrome is designed for packing large bags of 5 to 50 kgs. The bags could be HDPE woven, PP, paper or valve type. It is ideally suited for products such as rice, sugar, grains, pulses, flour, cake mix, cement and agro-chemical granules.\n\nThe PLC-controlled machine delivers output rates up to 20 bags per minute, and has a special 'no bag no filling' safety device. Other features include auto bag clamping, bulk and dribble feed, and bag tilting & alignment attachment with option of bag stitching or band sealing.",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Bulk Bag Filling',
      imageUrl: 'https://www.nichrome.com/images/2022/08/Bulk-bag-filling/Bulk-Bag-Filling-Machine-02.jpg',
      categories: ['Packaging Systems'],
      industries: ['Agrochemicals','Fertilizers','Primary Packaging'],
      description: "The new BULK PACKING MACHINE from Nichrome is designed for packing large bags of 5 to 50 kgs. The bags could be HDPE woven, PP, paper or valve type. It is ideally suited for products such as rice, sugar, grains, pulses, flour, cake mix, cement and agro-chemical granules.\n\nThe PLC-controlled machine delivers output rates up to 20 bags per minute, and has a special 'no bag no filling' safety device. Other features include auto bag clamping, bulk and dribble feed, and bag tilting & alignment attachment with option of bag stitching or band sealing.",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Semi Automatic Case Packer (Smart Case Packer)',
      imageUrl: 'https://www.nichrome.com/images/2022/12/27/smart-case-packer-large.jpg',
      categories: ['Packaging Systems'],
      industries: ['Secondary Packaging'],
      description: "Our Smart Case Packer is a semi-automatic solution for your carton bundling and case packaging needs.\n\nSimply insert a pre-formed case on to the machine and it inserts the bundled cartons automatically!\n\nCartoning counting, collating/bundling and insertion into case is fully automatic.\n\nFeatures:\n\t\t1) Ergonomically designed with robust construction\n\t\t2) PLC controlled with HMI\n\t\t3) Highly Flexible – designed for quick & easy product change-overs\n\t\t4) Carton collation monitoring\n\t\t5) Automatic collation of cartons and automatic insertion of collated carton in to case\n\t\t6) Sensors for product and safety monitoring\n\t\t7) Speed is upto 3 cases per minute (*can vary depending on collation matrix & carton dimensions)",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Fully Automatic Case Packer (Auto Case Packer)',
      imageUrl: 'https://www.nichrome.com/images/2023/07/17/Fully-Automatic-Case-Packer.jpg',
      categories: ['Packaging Systems'],
      industries: ['Secondary Packaging'],
      description: "Our Auto Case Packer is a fully automatic solution which –\n\t\t1) Automatically Forms Cases\n\t\t2) Automatically counts, collates and forms Carton matrix\n\t\t3) Automatically inserts collated Carton matrix into the Case\n\t\t4) Automatically tapes top and bottom of Case\n\t\t5) Speed of upto 6 shippers per minute (*can vary depending on carton size, weight & collation matrix)",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),






    Machine(
      name: 'Intelweigh Multi Head Weigher 10H/14H',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Intelligent_MHW.jpg',
      categories: ['Filling Systems'],
      industries: ['Oil', 'Powders','Grains','Sugar','Milk','Tea','Namkeen','Ready to eat','Agrochemicals','Fertilizers','Adhesives','Lube Oil'],
      description: "Combination Volume: Max. 3000 cc\nBucket Volume: 1.3 liters\nWeighing Range: 10 gm to 1000 gm\nAccuracy: 0.2 gm to 2 gm\nDisplay: 7 inch touch screen\nOperational Speed: Max. 70 dumps / min\nWeigh heads no: 10\nWeighing method with load cell\nBuckets open / close with stepper motor",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Intelweigh Combi Filler DH',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Intelligent_Weigh_Filler_Combi.jpg',
      categories: ['Filling Systems'],
      industries: ['Oil', 'Powders','Grains','Sugar','Milk','Tea','Namkeen','Ready to eat','Agrochemicals','Fertilizers','Adhesives','Lube Oil'],
      description: "Built in safety door guards with machine off interlock\nAvailable in broad range of filling capacities\nDumps/minute: 40 to 45 for 1kg/ 15 to 20 for 5 kg\nAccuracy % sd: 0.5%/0.2%",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),
    Machine(
      name: 'Easyfill Servo Auger',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Easyfill_servo_auger.jpg',
      categories: ['Filling Systems'],
      industries: ['Oil', 'Powders','Grains','Sugar','Milk','Tea','Namkeen','Ready to eat','Agrochemicals','Fertilizers','Adhesives','Lube Oil'],
      description: "Filling capacity: 5 cc to 2000 cc\nLevel sensor for high level\nServo driven auger mechanism\nRobust construction",
      videoUrl: 'https://www.youtube.com/watch?v=-KEXHildAog',  ///default
      pdfUrl: 'https://pdfobject.com/pdf/sample.pdf',
    ),

    // Add more machines with appropriate descriptions...
  ];

  // Method to return machines based on selected industry
  static Map<String, List<Machine>> getMachinesForIndustry(String industry) {
    List<Machine> packagingMachines = [];
    List<Machine> packagingSystems = [];
    List<Machine> fillingSystems = [];

    for (var machine in allMachines) {
      if (machine.industries.contains(industry)) {
        if (machine.categories.contains('Packaging Machines')) {
          packagingMachines.add(machine);
        }
        if (machine.categories.contains('Packaging Systems')) {
          packagingSystems.add(machine);
        }
        if (machine.categories.contains('Filling Systems')) {
          fillingSystems.add(machine);
        }
      }
    }

    return {
      'packagingMachines': packagingMachines,
      'packagingSystems': packagingSystems,
      'fillingSystems': fillingSystems,
    };
  }
}
