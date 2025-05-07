class BanglaLearningData {
  // স্বরবর্ণ (Vowels)
  static final List<Map<String, dynamic>> sworBorno = [
    {'letter': 'অ', 'example': 'অজগর', 'pronunciation': 'ô'},
    {'letter': 'আ', 'example': 'আম', 'pronunciation': 'a'},
    {'letter': 'ই', 'example': 'ইঁদুর', 'pronunciation': 'i'},
    {'letter': 'ঈ', 'example': 'ঈগল', 'pronunciation': 'ee'},
    {'letter': 'উ', 'example': 'উট', 'pronunciation': 'u'},
    {'letter': 'ঊ', 'example': 'ঊষা', 'pronunciation': 'oo'},
    {'letter': 'ঋ', 'example': 'ঋষি', 'pronunciation': 'ri'},
    {'letter': 'এ', 'example': 'এক', 'pronunciation': 'e'},
    {'letter': 'ঐ', 'example': 'ঐরাবত', 'pronunciation': 'oi'},
    {'letter': 'ও', 'example': 'ওজন', 'pronunciation': 'o'},
    {'letter': 'ঔ', 'example': 'ঔষধ', 'pronunciation': 'ou'},
  ];

  // ব্যঞ্জনবর্ণ (Consonants)
  static final List<Map<String, dynamic>> banjonBorno = [
    {'letter': 'ক', 'example': 'কলম', 'pronunciation': 'kô'},
    {'letter': 'খ', 'example': 'খরগোশ', 'pronunciation': 'khô'},
    {'letter': 'গ', 'example': 'গরু', 'pronunciation': 'gô'},
    {'letter': 'ঘ', 'example': 'ঘড়ি', 'pronunciation': 'ghô'},
    {'letter': 'ঙ', 'example': 'ব্যাঙ', 'pronunciation': 'ng-kar'},
    {'letter': 'চ', 'example': 'চাঁদ', 'pronunciation': 'chô'},
    {'letter': 'ছ', 'example': 'ছাতা', 'pronunciation': 'chhô'},
    {'letter': 'জ', 'example': 'জাহাজ', 'pronunciation': 'jô'},
    {'letter': 'ঝ', 'example': 'ঝরনা', 'pronunciation': 'jhô'},
    {'letter': 'ঞ', 'example': 'মিঞা', 'pronunciation': 'yô'},
    {'letter': 'ট', 'example': 'টমেটো', 'pronunciation': 'tô'},
    {'letter': 'ঠ', 'example': 'ঠোঁট', 'pronunciation': 'thô'},
    {'letter': 'ড', 'example': 'ডাক্তার', 'pronunciation': 'dô'},
    {'letter': 'ঢ', 'example': 'ঢাক', 'pronunciation': 'dhô'},
    {'letter': 'ণ', 'example': 'হরিণ', 'pronunciation': 'nô'},
    {'letter': 'ত', 'example': 'তালা', 'pronunciation': 'tô'},
    {'letter': 'থ', 'example': 'থালা', 'pronunciation': 'thô'},
    {'letter': 'দ', 'example': 'দরজা', 'pronunciation': 'dô'},
    {'letter': 'ধ', 'example': 'ধনুক', 'pronunciation': 'dhô'},
    {'letter': 'ন', 'example': 'নাক', 'pronunciation': 'nô'},
    {'letter': 'প', 'example': 'পাখি', 'pronunciation': 'pô'},
    {'letter': 'ফ', 'example': 'ফল', 'pronunciation': 'phô'},
    {'letter': 'ব', 'example': 'বই', 'pronunciation': 'bô'},
    {'letter': 'ভ', 'example': 'ভালুক', 'pronunciation': 'bhô'},
    {'letter': 'ম', 'example': 'মাছ', 'pronunciation': 'mô'},
    {'letter': 'য', 'example': 'যব', 'pronunciation': 'jô'},
    {'letter': 'র', 'example': 'রকেট', 'pronunciation': 'rô'},
    {'letter': 'ল', 'example': 'লাঠি', 'pronunciation': 'lô'},
    {'letter': 'শ', 'example': 'শামুক', 'pronunciation': 'shô'},
    {'letter': 'ষ', 'example': 'ষড়ঋতু', 'pronunciation': 'shô'},
    {'letter': 'স', 'example': 'সাপ', 'pronunciation': 'sô'},
    {'letter': 'হ', 'example': 'হাতি', 'pronunciation': 'hô'},
    {'letter': 'ড়', 'example': 'পড়া', 'pronunciation': 'rô'},
    {'letter': 'ঢ়', 'example': 'আষাঢ়', 'pronunciation': 'rhô'},
    {'letter': 'য়', 'example': 'ছায়া', 'pronunciation': 'yô'},
    {'letter': 'ৎ', 'example': 'উৎস', 'pronunciation': 't'},
    {'letter': 'ং', 'example': 'রং', 'pronunciation': 'ng'},
    {'letter': 'ঃ', 'example': 'দুঃখ', 'pronunciation': 'h'},
    {'letter': 'ঁ', 'example': 'চাঁদ', 'pronunciation': 'n'},
  ];

  // সংখ্যা (Numbers)
  static final List<Map<String, dynamic>> numbers = [
    {'bangla': '০', 'english': '0', 'banglaWord': 'শূন্য'},
    {'bangla': '১', 'english': '1', 'banglaWord': 'এক'},
    {'bangla': '২', 'english': '2', 'banglaWord': 'দুই'},
    {'bangla': '৩', 'english': '3', 'banglaWord': 'তিন'},
    {'bangla': '৪', 'english': '4', 'banglaWord': 'চার'},
    {'bangla': '৫', 'english': '5', 'banglaWord': 'পাঁচ'},
    {'bangla': '৬', 'english': '6', 'banglaWord': 'ছয়'},
    {'bangla': '৭', 'english': '7', 'banglaWord': 'সাত'},
    {'bangla': '৮', 'english': '8', 'banglaWord': 'আট'},
    {'bangla': '৯', 'english': '9', 'banglaWord': 'নয়'},
    {'bangla': '১০', 'english': '10', 'banglaWord': 'দশ'},
    {'bangla': '১১', 'english': '11', 'banglaWord': 'এগারো'},
    {'bangla': '১২', 'english': '12', 'banglaWord': 'বারো'},
    {'bangla': '১৩', 'english': '13', 'banglaWord': 'তেরো'},
    {'bangla': '১৪', 'english': '14', 'banglaWord': 'চৌদ্দ'},
    {'bangla': '১৫', 'english': '15', 'banglaWord': 'পনেরো'},
    {'bangla': '১৬', 'english': '16', 'banglaWord': 'ষোল'},
    {'bangla': '১৭', 'english': '17', 'banglaWord': 'সতেরো'},
    {'bangla': '১৮', 'english': '18', 'banglaWord': 'আঠারো'},
    {'bangla': '১৯', 'english': '19', 'banglaWord': 'উনিশ'},
    {'bangla': '২০', 'english': '20', 'banglaWord': 'বিশ'},
    {'bangla': '২১', 'english': '21', 'banglaWord': 'একুশ'},
    {'bangla': '২২', 'english': '22', 'banglaWord': 'বাইশ'},
    {'bangla': '২৩', 'english': '23', 'banglaWord': 'তেইশ'},
    {'bangla': '২৪', 'english': '24', 'banglaWord': 'চব্বিশ'},
    {'bangla': '২৫', 'english': '25', 'banglaWord': 'পঁচিশ'},
    {'bangla': '২৬', 'english': '26', 'banglaWord': 'ছাব্বিশ'},
    {'bangla': '২৭', 'english': '27', 'banglaWord': 'সাতাশ'},
    {'bangla': '২৮', 'english': '28', 'banglaWord': 'আঠাশ'},
    {'bangla': '২৯', 'english': '29', 'banglaWord': 'ঊনত্রিশ'},
    {'bangla': '৩০', 'english': '30', 'banglaWord': 'ত্রিশ'},
    {'bangla': '৩১', 'english': '31', 'banglaWord': 'একত্রিশ'},
    {'bangla': '৩২', 'english': '32', 'banglaWord': 'বত্রিশ'},
    {'bangla': '৩৩', 'english': '33', 'banglaWord': 'তেত্রিশ'},
    {'bangla': '৩৪', 'english': '34', 'banglaWord': 'চৌত্রিশ'},
    {'bangla': '৩৫', 'english': '35', 'banglaWord': 'পঁইত্রিশ'},
    {'bangla': '৩৬', 'english': '36', 'banglaWord': 'ছত্রিশ'},
    {'bangla': '৩৭', 'english': '37', 'banglaWord': 'সাঁইত্রিশ'},
    {'bangla': '৩৮', 'english': '38', 'banglaWord': 'আটত্রিশ'},
    {'bangla': '৩৯', 'english': '39', 'banglaWord': 'ঊনচল্লিশ'},
    {'bangla': '৪০', 'english': '40', 'banglaWord': 'চল্লিশ'},
    {'bangla': '৪১', 'english': '41', 'banglaWord': 'একচল্লিশ'},
    {'bangla': '৪২', 'english': '42', 'banglaWord': 'বিয়াল্লিশ'},
    {'bangla': '৪৩', 'english': '43', 'banglaWord': 'তেতাল্লিশ'},
    {'bangla': '৪৪', 'english': '44', 'banglaWord': 'চুয়াল্লিশ'},
    {'bangla': '৪৫', 'english': '45', 'banglaWord': 'পঁইচল্লিশ'},
    {'bangla': '৪৬', 'english': '46', 'banglaWord': 'ছেচল্লিশ'},
    {'bangla': '৪৭', 'english': '47', 'banglaWord': 'সাতচল্লিশ'},
    {'bangla': '৪৮', 'english': '48', 'banglaWord': 'আটচল্লিশ'},
    {'bangla': '৪৯', 'english': '49', 'banglaWord': 'ঊনপঞ্চাশ'},
    {'bangla': '৫০', 'english': '50', 'banglaWord': 'পঞ্চাশ'},
    {'bangla': '৫১', 'english': '51', 'banglaWord': 'একান্ন'},
    {'bangla': '৫২', 'english': '52', 'banglaWord': 'বাহান্ন'},
    {'bangla': '৫৩', 'english': '53', 'banglaWord': 'তিপ্পান্ন'},
    {'bangla': '৫৪', 'english': '54', 'banglaWord': 'চুয়ান্ন'},
    {'bangla': '৫৫', 'english': '55', 'banglaWord': 'পঁচান্ন'},
    {'bangla': '৫৬', 'english': '56', 'banglaWord': 'ছাপ্পান্ন'},
    {'bangla': '৫৭', 'english': '57', 'banglaWord': 'সাতান্ন'},
    {'bangla': '৫৮', 'english': '58', 'banglaWord': 'আটান্ন'},
    {'bangla': '৫৯', 'english': '59', 'banglaWord': 'ঊনষাট'},
    {'bangla': '৬০', 'english': '60', 'banglaWord': 'ষাট'},
    {'bangla': '৬১', 'english': '61', 'banglaWord': 'একষট্টি'},
    {'bangla': '৬২', 'english': '62', 'banglaWord': 'বাষট্টি'},
    {'bangla': '৬৩', 'english': '63', 'banglaWord': 'তেষট্টি'},
    {'bangla': '৬৪', 'english': '64', 'banglaWord': 'চৌষট্টি'},
    {'bangla': '৬৫', 'english': '65', 'banglaWord': 'পঁইষট্টি'},
    {'bangla': '৬৬', 'english': '66', 'banglaWord': 'ছেষট্টি'},
    {'bangla': '৬৭', 'english': '67', 'banglaWord': 'সাতষট্টি'},
    {'bangla': '৬৮', 'english': '68', 'banglaWord': 'আটষট্টি'},
    {'bangla': '৬৯', 'english': '69', 'banglaWord': 'ঊনসত্তর'},
    {'bangla': '৭০', 'english': '70', 'banglaWord': 'সত্তর'},
    {'bangla': '৭১', 'english': '71', 'banglaWord': 'একাত্তর'},
    {'bangla': '৭২', 'english': '72', 'banglaWord': 'বাহাত্তর'},
    {'bangla': '৭৩', 'english': '73', 'banglaWord': 'তিয়াত্তর'},
    {'bangla': '৭৪', 'english': '74', 'banglaWord': 'চুয়াত্তর'},
    {'bangla': '৭৫', 'english': '75', 'banglaWord': 'পঁচাত্তর'},
    {'bangla': '৭৬', 'english': '76', 'banglaWord': 'ছিয়াত্তর'},
    {'bangla': '৭৭', 'english': '77', 'banglaWord': 'সাতাত্তর'},
    {'bangla': '৭৮', 'english': '78', 'banglaWord': 'আটাত্তর'},
    {'bangla': '৭৯', 'english': '79', 'banglaWord': 'ঊনআশি'},
    {'bangla': '৮০', 'english': '80', 'banglaWord': 'আশি'},
    {'bangla': '৮১', 'english': '81', 'banglaWord': 'একাশি'},
    {'bangla': '৮২', 'english': '82', 'banglaWord': 'বিরাশি'},
    {'bangla': '৮৩', 'english': '83', 'banglaWord': 'তিরাশি'},
    {'bangla': '৮৪', 'english': '84', 'banglaWord': 'চুরাশি'},
    {'bangla': '৮৫', 'english': '85', 'banglaWord': 'পঁচাশি'},
    {'bangla': '৮৬', 'english': '86', 'banglaWord': 'ছিয়াশি'},
    {'bangla': '৮৭', 'english': '87', 'banglaWord': 'সাতাশি'},
    {'bangla': '৮৮', 'english': '88', 'banglaWord': 'আটাশি'},
    {'bangla': '৮৯', 'english': '89', 'banglaWord': 'ঊননব্বই'},
    {'bangla': '৯০', 'english': '90', 'banglaWord': 'নব্বই'},
    {'bangla': '৯১', 'english': '91', 'banglaWord': 'একানব্বই'},
    {'bangla': '৯২', 'english': '92', 'banglaWord': 'বিরানব্বই'},
    {'bangla': '৯৩', 'english': '93', 'banglaWord': 'তিরানব্বই'},
    {'bangla': '৯৪', 'english': '94', 'banglaWord': 'চুরানব্বই'},
    {'bangla': '৯৫', 'english': '95', 'banglaWord': 'পঁচানব্বই'},
    {'bangla': '৯৬', 'english': '96', 'banglaWord': 'ছিয়ানব্বই'},
    {'bangla': '৯৭', 'english': '97', 'banglaWord': 'সাতানব্বই'},
    {'bangla': '৯৮', 'english': '98', 'banglaWord': 'আটানব্বই'},
    {'bangla': '৯৯', 'english': '99', 'banglaWord': 'নিরানব্বই'},
    {'bangla': '১০০', 'english': '100', 'banglaWord': 'একশো'},
  ];

  // নামতা (Multiplication Tables)
  static final Map<int, List<String>> namta = {
    1: [
      '১ × ১ = ১',
      '১ × ২ = ২',
      '১ × ৩ = ৩',
      '১ × ৪ = ৪',
      '১ × ৫ = ৫',
      '১ × ৬ = ৬',
      '১ × ৭ = ৭',
      '১ × ৮ = ৮',
      '১ × ৯ = ৯',
      '১ × ১০ = ১০',
    ],
    2: [
      '২ × ১ = ২',
      '২ × ২ = ৪',
      '২ × ৩ = ৬',
      '২ × ৪ = ৮',
      '২ × ৫ = ১০',
      '২ × ৬ = ১২',
      '২ × ৭ = ১৪',
      '২ × ৮ = ১৬',
      '২ × ৯ = ১৮',
      '২ × ১০ = ২০',
    ],
    3: [
      '৩ × ১ = ৩',
      '৩ × ২ = ৬',
      '৩ × ৩ = ৯',
      '৩ × ৪ = ১২',
      '৩ × ৫ = ১৫',
      '৩ × ৬ = ১৮',
      '৩ × ৭ = ২১',
      '৩ × ৮ = ২৪',
      '৩ × ৯ = ২৭',
      '৩ × ১০ = ৩০',
    ],
    4: [
      '৪ × ১ = ৪',
      '৪ × ২ = ৮',
      '৪ × ৩ = ১২',
      '৪ × ৪ = ১৬',
      '৪ × ৫ = ২০',
      '৪ × ৬ = ২৪',
      '৪ × ৭ = ২৮',
      '৪ × ৮ = ৩২',
      '৪ × ৯ = ৩৬',
      '৪ × ১০ = ৪০',
    ],
    5: [
      '৫ × ১ = ৫',
      '৫ × ২ = ১০',
      '৫ × ৩ = ১৫',
      '৫ × ৪ = ২০',
      '৫ × ৫ = ২৫',
      '৫ × ৬ = ৩০',
      '৫ × ৭ = ৩৫',
      '৫ × ৮ = ৪০',
      '৫ × ৯ = ৪৫',
      '৫ × ১০ = ৫০',
    ],
    6: [
      '৬ × ১ = ৬',
      '৬ × ২ = ১২',
      '৬ × ৩ = ১৮',
      '৬ × ৪ = ২৪',
      '৬ × ৫ = ৩০',
      '৬ × ৬ = ৩৬',
      '৬ × ৭ = ৪২',
      '৬ × ৮ = ৪৮',
      '৬ × ৯ = ৫৪',
      '৬ × ১০ = ৬০',
    ],
    7: [
      '৭ × ১ = ৭',
      '৭ × ২ = ১৪',
      '৭ × ৩ = ২১',
      '৭ × ৪ = ২৮',
      '৭ × ৫ = ৩৫',
      '৭ × ৬ = ৪২',
      '৭ × ৭ = ৪৯',
      '৭ × ৮ = ৫৬',
      '৭ × ৯ = ৬৩',
      '৭ × ১০ = ৭০',
    ],
    8: [
      '৮ × ১ = ৮',
      '৮ × ২ = ১৬',
      '৮ × ৩ = ২৪',
      '৮ × ৪ = ৩২',
      '৮ × ৫ = ৪০',
      '৮ × ৬ = ৪৮',
      '৮ × ৭ = ৫৬',
      '৮ × ৮ = ৬৪',
      '৮ × ৯ = ৭২',
      '৮ × ১০ = ৮০',
    ],
    9: [
      '৯ × ১ = ৯',
      '৯ × ২ = ১৮',
      '৯ × ৩ = ২৭',
      '৯ × ৪ = ৩৬',
      '৯ × ৫ = ৪৫',
      '৯ × ৬ = ৫৪',
      '৯ × ৭ = ৬৩',
      '৯ × ৮ = ৭২',
      '৯ × ৯ = ৮১',
      '৯ × ১০ = ৯০',
    ],
    10: [
      '১০ × ১ = ১০',
      '১০ × ২ = ২০',
      '১০ × ৩ = ৩০',
      '১০ × ৪ = ৪০',
      '১০ × ৫ = ৫০',
      '১০ × ৬ = ৬০',
      '১০ × ৭ = ৭০',
      '১০ × ৮ = ৮০',
      '১০ × ৯ = ৯০',
      '১০ × ১০ = ১০০',
    ],
  };

  // বাংলা সপ্তাহের নাম (Days of the Week)
  static final List<Map<String, String>> weekDays = [
    {'day': 'শুক্রবার', 'english': 'Friday'},
    {'day': 'শনিবার', 'english': 'Saturday'},
    {'day': 'রবিবার', 'english': 'Sunday'},
    {'day': 'সোমবার', 'english': 'Monday'},
    {'day': 'মঙ্গলবার', 'english': 'Tuesday'},
    {'day': 'বুধবার', 'english': 'Wednesday'},
    {'day': 'বৃহস্পতিবার', 'english': 'Thursday'},
  ];

  // বাংলা মাসের নাম (Months)
  static final List<Map<String, String>> months = [
    {'bangla': 'বৈশাখ', 'english': 'Boishakh (April-May)'},
    {'bangla': 'জ্যৈষ্ঠ', 'english': 'Joishtho (May-June)'},
    {'bangla': 'আষাঢ়', 'english': 'Asharh (June-July)'},
    {'bangla': 'শ্রাবণ', 'english': 'Srabon (July-August)'},
    {'bangla': 'ভাদ্র', 'english': 'Bhadro (August-September)'},
    {'bangla': 'আশ্বিন', 'english': 'Ashwin (September-October)'},
    {'bangla': 'কার্তিক', 'english': 'Kartik (October-November)'},
    {'bangla': 'অগ্রহায়ন', 'english': 'Aghrahayon (November-December)'},
    {'bangla': 'পৌষ', 'english': 'Poush (December-January)'},
    {'bangla': 'মাঘ', 'english': 'Magh (January-February)'},
    {'bangla': 'ফাল্গুন', 'english': 'Falgun (February-March)'},
    {'bangla': 'চৈত্র', 'english': 'Choitro (March-April)'},
  ];

  // বাংলা ঋতু (Seasons)
  static final List<Map<String, dynamic>> seasons = [
    {
      'name': 'গ্রীষ্ম',
      'english': 'Summer',
      'months': ['বৈশাখ', 'জ্যৈষ্ঠ'],
      'description': 'বছরের সবচেয়ে গরমকাল। তাপমাত্রা খুব বেশি থাকে।',
      'image': 'assets/images/summer.jpg',
    },
    {
      'name': 'বর্ষা',
      'english': 'Rainy Season',
      'months': ['আষাঢ়', 'শ্রাবণ'],
      'description': 'প্রচুর বৃষ্টি ও বন্যা হয়। চারদিকে সবুজ দেখা যায়।',
      'image': 'assets/images/rainy.jpg',
    },
    {
      'name': 'শরৎ',
      'english': 'Autumn',
      'months': ['ভাদ্র', 'আশ্বিন'],
      'description': 'শিশির পড়া শুরু হয়। আকাশে সাদা মেঘ দেখা যায়।',
      'image': 'assets/images/autumn.jpg',
    },
    {
      'name': 'হেমন্ত',
      'english': 'Late Autumn',
      'months': ['কার্তিক', 'অগ্রহায়ন'],
      'description': 'সকালে কুয়াশা থাকে। ফসল ঘরে তোলার সময়।',
      'image': 'assets/images/late_autumn.jpg',
    },
    {
      'name': 'শীত',
      'english': 'Winter',
      'months': ['পৌষ', 'মাঘ'],
      'description': 'বছরের সবচেয়ে ঠান্ডা সময়। কুয়াশা ও শীতের প্রকোপ বেশি।',
      'image': 'assets/images/winter.jpg',
    },
    {
      'name': 'বসন্ত',
      'english': 'Spring',
      'months': ['ফাল্গুন', 'চৈত্র'],
      'description': 'প্রকৃতি নতুন রূপ ধারণ করে। গাছে নতুন পাতা ও ফুল ফোটে।',
      'image': 'assets/images/spring.jpg',
    },
  ];

  // বাংলা কবিতা (Poems)
  static final List<Map<String, String>> poems = [
    {
      'title': 'আমি হব সকাল বেলার পাখি',
      'poet': 'কাজী নজরুল ইসলাম',
      'poem':
          'আমি হব সকাল বেলার পাখি\n'
          'সবার আগে কুসুম বাগে\n'
          'উঠব আমি ডাকি।\n\n'
          'সুয্যি মামা জাগার আগে\n'
          'উঠব আমি জেগে,\n'
          "'হয়নি সকাল, ঘুমোও এখন',\n"
          'মা বলবেন রেগে।\n\n'
          "বলব আমি- 'আলসে মেয়ে\n"
          'ঘুমিয়ে তুমি থাক,\n'
          'হয়নি সকাল, তাই বলে কি\n'
          'সকাল হবে নাক\'?\n\n'
          'আমরা যদি না জাগি মা\n'
          'কেমনে সকাল হবে ?\n'
          'তোমার ছেলে উঠবে গো মা\n'
          'রাত পোহাবে তবে।',
      'image': 'assets/images/poem.png',
    },
    {
      'title': 'আদর্শ ছেলে',
      'poet': 'কুসুম কুমারী দাশ',
      'poem':
          'আমাদের দেশে হবে সেই ছেলে কবে\n'
          'কথায় না বড় হয়ে কাজে বড় হবে?\n'
          'মুখে হাসি বুকে বল, তেজে ভরা মন\n'
          '‘মানুষ হইতে হবে‘ – এই যার পণ৷\n'
          'বিপদ আসিলে কাছে হও আগুয়ান\n'
          'নাই কি শরীরে তব রক্ত, মাংস, প্রাণ?\n'
          'হাত পা সবারই আছে, মিছে কেন ভয়?\n'
          'চেতনা রয়েছে যার, সে কি পড়ে রয়?\n'
          'সে ছেলে কে চায় বল, কথায় কথায়\n'
          'আসে যার চোখে জল, মাথা ঘুরে যায়?\n'
          'মনে প্রাণে খাট সবে, শক্তি কর দান,\n'
          'তোমরা ‘মানুষ’ হলে দেশের কল্যাণ৷',
      'image': 'assets/images/poem.png',
    },
    {
      'title': 'ছুটি',
      'poet': 'রবীন্দ্রনাথ ঠাকুর',
      'poem':
          'মেঘের কোলে রোদ হেসেছে,\n'
          'বাদল গেছে টুটি।\n'
          'আজ আমাদের ছুটি, ও ভাই,\n'
          'আজ আমাদের ছুটি।\n'
          'কী করি আজ ভেবে না পাই,\n'
          'পথ হারিয়ে কোন্‌ বনে যাই,\n'
          'কোন্‌ মাঠে যে ছুটে বেড়াই,\n'
          'সকল ছেলে জুটি।।\n',
      'image': 'assets/images/poem.png',
    },
    {
      'title': 'প্রভাতী',
      'poet': 'কাজী নজরুল ইসলাম',
      'poem':
          'ভোর হলো\n'
          '\n'
          'দোর খোলো\n'
          'খুকুমণি ওঠ রে!\n'
          'ঐ ডাকে\n'
          'যুঁই-শাখে\n'
          'ফুল-খুকি ছোট রে!\n'
          '\n'
          'খুকুমণি ওঠে রে!\n'
          'রবি মামা\n'
          'দেয় হামা\n'
          'গায়ে রাঙা জামা ঐ,\n'
          'দারোয়ান\n'
          '\n'
          'গায় গান\n'
          'শোনো ঐ “রামা হৈ!”\n'
          'ত্যাজি’ নীড়\n'
          'ক’রে ভীড়\n'
          'ওড়ে পাখি আকাশে,\n'
          'এন্তার\n'
          'গান তার\n'
          'ভাসে ভোর বাতাসে!\n'
          'চুলবুল\n'
          'বুলবুল\n'
          'শিস্ দেয় পুষ্পে,\n'
          'এইবার\n'
          'এইবার\n'
          'খুকুমণি উঠবে!\n'
          'খুলি’ হাল\n'
          'তুলি’ পাল\n'
          'ঐ তরী চললো,\n'
          'এইবার\n'
          'এইবার\n'
          'খুকু চোখ খুললো!\n'
          'আলসে\n'
          'নয় সে\n'
          'ওঠে রোজ সকালে,\n'
          'রোজ তাই\n'
          'চাঁদা ভাই\n'
          'টিপ দেয় কপালে!\n'
          '\n'
          'উঠলো\n'
          'ছুটলো\n'
          'ঐ খোকাখুকি সব,\n'
          '“উঠেছে\n'
          'আগে কে”\n'
          'ঐ শোনো কলরব!\n'
          'নাই রাত,\n'
          'মুখ হাত\n'
          'ধোও, খুকু জাগো রে!\n'
          'জয় গানে\n'
          'ভগবানে\n'
          'তুষি’ বর মাগো রে!',
      'image': 'assets/images/poem.png',
    },
    {
      'title': 'পারিব না',
      'poet': 'কালীপ্রসন্ন ঘোষ',
      'poem':
          '‘পারিব না’ একথাটি বলিও না আর,\n'
          'কেন পারিবে না তাহা ভাব একবার;\n'
          'পাঁচজনে পারে যাহা,\n'
          'তুমিও পারিবে তাহা,\n'
          'পার কি না পার কর যতন আবার\n'
          'একবার না পারিলে দেখ শতবার।\n'
          'পারিবে না বলে মুখ করিও না ভার,\n'
          'ও কথাটি মুখে যেন না শুনি তোমার।\n'
          'অলস অবোধ যারা\n'
          'কিছুই পারে না তারা,\n'
          'তোমায় তো দেখি নাক তাদের আকার\n'
          'তবে কেন ‘পারিব না’ বল বার বার ?\n'
          'জলে না নামিলে কেহ শিখে না সাঁতার,\n'
          'হাঁটিতে শিখে না কেহ না খেয়ে আছাড়,\n'
          'সাঁতার শিখিতে হলে\n'
          'আগে তবে নাম জলে,\n'
          'আছাড়ে করিয়া হেলা ‘হাঁট’ আর বার;\n'
          'পারিব বলিয়া সুখে হও আগুসার।',
      'image': 'assets/images/poem.png',
    },
    {
      'title': 'মামার বাড়ি',
      'poet': 'জসীমউদ্দীন',
      'poem':
          'আয় ছেলেরা আয় মেয়েরা,\n'
          'ফুল তুলিতে যাই\n'
          'ফুলের মালা গলায় দিয়ে\n'
          'মামার বাড়ি যাই।\n'
          'মামার বাড়ি পদ্মপুকুর\n'
          'গলায় গলায় জল,\n'
          'এপার হতে ওপার গিয়ে\n'
          'নাচে ঢেউয়ের দল।\n'
          'দিনে সেথায় ঘুমিয়ে থাকে\n'
          'লাল শালুকের ফুল,\n'
          'রাতের বেলা চাঁদের সনে\n'
          'হেসে না পায় কূল।\n'
          'আম-কাঁঠালের বনের ধারে\n'
          'মামা-বাড়ির ঘর,\n'
          'আকাশ হতে জোছনা-কুসুম\n'
          'ঝরে মাথার ‘পর।\n'
          'রাতের বেলা জোনাক জ্বলে\n'
          'বাঁশ-বাগানের ছায়,\n'
          'শিমুল গাছের শাখায় বসে\n'
          'ভোরের পাখি গায়।\n'
          'ঝড়ের দিনে মামার দেশে\n'
          'আম কুড়াতে সুখ\n'
          'পাকা জামের শাখায় উঠি\n'
          'রঙিন করি মুখ।\n'
          'কাঁদি-ভরা খেজুর গাছে\n'
          'পাকা খেজুর দোলে\n'
          'ছেলেমেয়ে, আয় ছুটে যাই\n'
          'মামার দেশে চলে।',
      'image': 'assets/images/poem.png',
    },
    {
      'title': 'কাজলা দিদি',
      'poet': 'যতীন্দ্রমোহন বাগচী',
      'poem':
          'বাঁশ-বাগানের মাথার উপর চাঁদ উঠেছে ওই,\n'
          'মাগো আমার শোলক্-বলা কাজলা দিদি কই?\n'
          'পুকুর ধারে লেবুর তলে,\n'
          'থোকায় থোকায় জোনাক জ্বলে,\n'
          'ফুলের গন্ধে ঘুম আসে না, একলা জেগে রই,\n'
          'মাগো আমার কোলের কাছে কাজলা দিদি কই?\n\n'
          'সেদিন হতে কেন মা আর দিদিরে না ডাকো;\n'
          'দিদির কথায় আঁচল দিয়ে মুখটি কেন ঢাকো?\n'
          'খাবার খেতে আসি যখন\n'
          'দিদি বলে ডাকি তখন,\n'
          'ও-ঘর থেকে কেন মা আর দিদি আসে নাকো?\n'
          'আমি ডাকি, তুমি কেন চুপটি করে থাকো?\n\n'
          'বল্ মা দিদি কোথায় গেছে, আসবে আবার কবে?\n'
          'কাল যে আমার নতুন ঘরে পুতুল বিয়ে হবে!\n'
          'দিদির মত ফাঁকি দিয়ে\n'
          'আমিও যদি লুকাই গিয়ে\n'
          'তুমি তখন একলা ঘরে কেমন ক\'রে রবে?\n'
          'আমিও নাই---দিদিও নাই---কেমন মজা হবে!\n\n'
          'ভূঁই-চাঁপাতে ভরে গেছে শিউলী গাছের তল,\n'
          'মাড়াস্ নে মা পুকুর থেকে আনবি যখন জল |\n'
          'ডালিম গাছের ফাঁকে ফাঁকে\n'
          'বুলবুলিটা লুকিয়ে থাকে,\n'
          'উড়িয়ে তুমি দিও না মা ছিঁড়তে গিয়ে ফল,\n'
          'দিদি যখন শুনবে এসে বলবি কি মা বল্ |\n\n'
          'বাঁশ-বাগানের মাথার উপর চাঁদ উঠেছে ওই,\n'
          'এমন সময় মাগো আমার কাজলা দিদি কই?\n'
          'লেবুর তলে পুকুর পাড়ে\n'
          'ঝিঁঝিঁ ডাকে ঝোপে ঝাড়ে,\n'
          'ফুলের গন্ধে ঘুম আসে না, তাইতো জেগে রই,---\n'
          'রাত্রি হোল মাগো, আমার কাজলা দিদি কই?',
      'image': 'assets/images/poem.png',
    },
    {
      'title': 'রাখাল ছেলে',
      'poet': 'জসীমউদ্দীন',
      'poem':
          '‘রাখাল ছেলে! রাখাল ছেলে! বারেক ফিরে চাও,\n'
          'বাঁকা গাঁয়ের পথটি বেয়ে কোথায় চলে যাও?’\n'
          '‘ওই যে দেখ নীল-নোয়ান সবুজ ঘেরা গাঁ\n'
          'কলার পাতা দোলায় চামর শিশির ধোয়ায় পা;\n'
          'সেথায় আছে ছোট্ট কুটির সোনার পাতায় ছাওয়া,\n'
          'সেই ঘরেতে একলা বসে ডাকছে আমার মা\n'
          'সেথায় যাব, ও ভাই এবার আমায় ছাড় না!’\n\n'
          'রাখাল ছেলে! রাখাল ছেলে! আবার কোথায় ধাও,\n'
          'পূব আকাশে ছাড়ল সবে রঙিন মেঘের নাও।’\n'
          '‘ঘুম হতে আজ জেগেই দেখি শিশির-ঝরা ঘাসে,\n'
          'সারা রাতের স্বপন আমার মিঠেল রোদে হাসে।\n'
          'আমার সাথে করতে খেলা প্রভাত হাওয়া ভাই,\n'
          'সরষে ফুলের পাঁপড়ি নাড়ি ডাকছে মোরে তাই।\n'
          'চলতে পথে মটরশুঁটি জড়িয়ে দু-খান পা,\n'
          'বলছে ডেকে, ‘গাঁয়ের রাখাল একটু খেলে যা!’\n'
          'সারা মাঠের ডাক এসেছে, খেলতে হবে ভাই!\n'
          'সাঁঝের বেলা কইব কথা এখন তবে যাই!’\n\n'
          '‘রাখাল ছেলে! রাখাল ছেলে! সারাটা দিন খেলা,\n'
          'এ যে বড় বাড়াবাড়ি, কাজ আছে যে মেলা!’\n'
          '‘কাজের কথা জানিনে ভাই, লাঙল দিয়ে খেলি\n'
          'নিড়িয়ে দেই ধানের ক্ষেতের সবিজ রঙের চেলি\n'
          'সরষে বালা নুইয়ে গলা হলদে হওয়ার সুখে\n'
          'মটর বোনে ঘোমটা খুলে চুম দিয়ে যায় মুখে!\n'
          'ঝাউয়ের ঝাড়ে বাজায় বাঁশি পঊষ-পাগল বুড়ি,\n'
          'আমরা সেথা চষতে লাঙল মুর্শিদা-গান জুড়ি।\n'
          'খেলা মোদের গান গাওয়া ভাই, খেলা লাঙল-চষা\n'
          'সারাটা দিন খেলতে জানি, জানিই নেকো বসা।’',
      'image': 'assets/images/poem.png',
    },
    {
      'title': 'কাজের লোক',
      'poet': 'নবকৃষ্ণ ভট্টাচার্য',
      'poem':
          '“মৌমাছি, মৌমাছি,\n'
          'কোথা যাও নাচি\' নাচি\'\n'
          'দাঁড়াও না একবার ভাই।”\n'
          '“ওই ফুল ফোটে বনে,\n'
          'যাই মধু আহরণে\n'
          'দাঁড়াবার সময় তো নাই।”\n\n'
          '“ছোট পাখি, ছোট পাখি,\n'
          'কিচি-মিচি ডাকি ডাকি\'\n'
          'কোথা যাও বলে যাও শুনি?”\n'
          '“এখন না ক\'ব কথা,\n'
          'আনিয়াছি তৃণলতা,\n'
          'আপনার বাসা আগে বুনি।”\n\n'
          '“পিপীলিকা, পিপীলিকা,\n'
          'দল-বল ছাড়ি একা\n'
          'কোথা যাও, যাও ভাই বলি।”\n'
          '“শীতের সঞ্চয় চাই,\n'
          'খাদ্য খুঁজিতেছি তাই\n'
          'ছয় পায়ে পিল পিল চলি।”',
      'image': 'assets/images/poem.png',
    },
    {
      'title': 'বাক্ বাক্ কুম্',
      'poet': 'রোকনুজ্জামান খান',
      'poem':
          'বাক্ বাক্ কুম্ পায়রা\n'
          'মাথায় দিয়ে টায়রা,\n'
          'বউ সাজবে কাল কি\n'
          'চড়বে সোনার পালকি।\n',
      'image': 'assets/images/poem.png',
    },
    {
      'title': 'লেখাপড়া করে যেই',
      'poet': 'মদনমোহন তর্কালঙ্কার',
      'poem':
          'লেখাপড়া করে যেই\n'
          'গাড়ি ঘোড়া চড়ে সেই।\n'
          'লেখাপড়া যেই জানে\n'
          'সব লোক তারে মানে।\n'
          'মিছা কথা নাহি কবে।\n'
          'কটু ভাষী নাহি হবে\n'
          'পর ধন নাহি লবে\n'
          'চিরদিন সুখে রবে।\n'
          'পিতামাতা গুরুজনে\n'
          'সেবা কর কায় মনে।\n',
      'image': 'assets/images/poem.png',
    },
    {
      'title': 'দোয়েল',
      'poet': 'সি এম সালাহ উদ্দিন',
      'poem':
          'দোয়েল মোদের জাতীয় পাখি\n'
          'মিষ্টি সুরে উঠল ডাকি,\n'
          'পেটটি সাদা পিটটি কালো\n'
          'এই পাখিটি দেখতে ভালো,\n'
          'ফুল বাগানে সবুজ বনে\n'
          'শিষ দেয় সে আপন মনে।\n',
      'image': 'assets/images/poem.png',
    },
  ];
}
