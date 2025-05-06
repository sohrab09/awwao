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
    },
    {
      'name': 'বর্ষা',
      'english': 'Rainy Season',
      'months': ['আষাঢ়', 'শ্রাবণ'],
      'description': 'প্রচুর বৃষ্টি ও বন্যা হয়। চারদিকে সবুজ দেখা যায়।',
    },
    {
      'name': 'শরৎ',
      'english': 'Autumn',
      'months': ['ভাদ্র', 'আশ্বিন'],
      'description': 'শিশির পড়া শুরু হয়। আকাশে সাদা মেঘ দেখা যায়।',
    },
    {
      'name': 'হেমন্ত',
      'english': 'Late Autumn',
      'months': ['কার্তিক', 'অগ্রহায়ন'],
      'description': 'সকালে কুয়াশা থাকে। ফসল ঘরে তোলার সময়।',
    },
    {
      'name': 'শীত',
      'english': 'Winter',
      'months': ['পৌষ', 'মাঘ'],
      'description': 'বছরের সবচেয়ে ঠান্ডা সময়। কুয়াশা ও শীতের প্রকোপ বেশি।',
    },
    {
      'name': 'বসন্ত',
      'english': 'Spring',
      'months': ['ফাল্গুন', 'চৈত্র'],
      'description': 'প্রকৃতি নতুন রূপ ধারণ করে। গাছে নতুন পাতা ও ফুল ফোটে।',
    },
  ];

  // বাংলা কবিতা (Poems)
  static final List<Map<String, String>> poems = [
    {
      'title': 'ছোট নদী',
      'poet': 'রবীন্দ্রনাথ ঠাকুর',
      'poem':
          'ছোট নদী ক্ষীণ নদী শুকায়ে গেছে জল,\n'
          'পাষাণ পৃথিবী হায় এমনি নিষ্ঠুর!\n'
          'সবে দেয় তারি কাছে যে দিতে পারে সব,\n'
          'সবে নেয় তারি কাছে যাহার কিছু নাই!\n'
          'ছোট নদী পথে পথে ভিক্ষা করে বেড়ায়,\n'
          'মরুভূমি দিল না তো কণামাত্র কিছু--\n'
          'ব্যথিত পৃথিবী দেখে তারি কাঁচা বুকের,\n'
          'বুকের রক্ত ঢেলে আকাশেতে মেলে,\n'
          'হাত দুটি উদার করুণা, পূর্ণ মেঘ হয়,\n'
          'সবার তরে উজাড় করে দিল।',
    },
    {
      'title': 'ফুল ফুটুক না ফুটুক',
      'poet': 'কাজী নজরুল ইসলাম',
      'poem':
          'ফুল ফুটুক না ফুটুক আজ বসন্ত এসেছে বনে বনে,\n'
          'ফুল ফুটুক না ফুটুক আজ বসন্ত মোর মনে মনে।\n'
          'ফুল ফুটুক না ফুটুক আজ হৃদয়ে মোর কুঁড়ি ধরেছে,\n'
          'ফুল ফুটুক না ফুটুক আজ কোকিল মোর কেন মরেছে?\n'
          'ফুল ফুটুক না ফুটুক আজ মধুর মৌমাছি করে গুঞ্জন,\n'
          'ফুল ফুটুক না ফুটুক আজ ভালবেসে মোর হৃদয় হল মগন!',
    },
    {
      'title': 'আমার পুতুল',
      'poet': 'সুকান্ত ভট্টাচার্য',
      'poem':
          'আমার পুতুল আমায় কাঁদায়\n'
          'কাঁদলে আমি খুশি হই;\n'
          'আমার পুতুল হাসলে আমার\n'
          'গালে হাসি ফুটে রই।\n'
          'যে দিন আমার পুতুল হারায়\n'
          'কাঁদি আমি সারারাত;\n'
          'সে দিন আমার ভাত ভালো লাগে না\n'
          'ঘুমিয়ে কাটে না রাত।',
    },
    {
      'title': 'সাগর',
      'poet': 'জীবনানন্দ দাশ',
      'poem':
          'সাগরের জল দেখি কত মনে\n'
          'ভাব যায় মোর,\n'
          'একা বসে বেলাতটে শুনি\n'
          'ঢেউয়ের ঘোর।\n'
          'শুধু নীল চোখ মেলে ভাবি\n'
          'কোথা থেকে এল সাগর নদী,\n'
          'সাগর ক্লান্ত হয়েছে কি\n'
          'এত দিন পথ চলে?',
    },
    {
      'title': 'মা',
      'poet': 'শামসুর রাহমান',
      'poem':
          'মা বলেছেন, বাবা বলেছেন\n'
          'বড় হয়ে ভালো হতে হবে;\n'
          'ভালো ছেলে যারা পড়াশোনা করে\n'
          'কাজের ছেলে তারা সবে।\n'
          'মা বলেছেন, বাবা বলেছেন\n'
          'বড় হয়ে দেশ গড়তে হবে;\n'
          'ভালো মানুষ যারা দেশ গড়ে তারা\n'
          'সবাই ভালোবাসে তাদের সবে।',
    },
    {
      'title': 'শিশু',
      'poet': 'রবীন্দ্রনাথ ঠাকুর',
      'poem':
          'শিশু থাকে আপনার মনে,\n'
          'কী যে ভাবে কে তা জানে!\n'
          'প্রবুদ্ধ করে যারে\n'
          'উদাসীন তারে,\n'
          'যে কথা বলে তাহার মূল্য সে দেয় না কিছু জানে!\n'
          'শিশু থাকে আপনার মনে।',
    },
    {
      'title': 'বৃষ্টি',
      'poet': 'আল মাহমুদ',
      'poem':
          'ঝুম ঝুম ঝুম বৃষ্টি নামে\n'
          'পাতা নাচে ঘাস নাচে\n'
          'দুপুর বেলা খাল ভরে যায়,\n'
          'দেখতে যায় সবাই পাশে।\n'
          'নাচে নাচে পাখিরা সব\n'
          'ঝুপসি ভিজে সুর ভরে গায়,\n'
          'ঝুপ ঝুপ ঝুপ বৃষ্টি নামে\n'
          'তাদের গান শোনা যায়।',
    },
  ];
}
