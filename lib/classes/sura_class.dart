class Surah {
  final String name;
  final String englishName;
  final int verseCount;
  final List<Verse> verses;

  const Surah({
    required this.name,
    required this.englishName,
    required this.verseCount,
    required this.verses,
  });
}

class Verse {
  final int number;
  final String arabicText;
  final String translation;
  final String banglaTranslation;

  const Verse({
    required this.number,
    required this.arabicText,
    required this.translation,
    required this.banglaTranslation,
  });
}

// Data
final List<Surah> quranSurahs = [
  Surah(
    name: 'الفاتحة',
    englishName: 'Al-Fatihah (The Opening)',
    verseCount: 7,
    verses: [
      Verse(
        number: 1,
        arabicText: 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
        translation:
            'In the name of Allah, the Entirely Merciful, the Especially Merciful.',
        banglaTranslation: 'পরম করুণাময় অতি দয়ালু আল্লাহর নামে।',
      ),
      Verse(
        number: 2,
        arabicText: 'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
        translation: 'All praise is due to Allah, Lord of the worlds.',
        banglaTranslation:
            'সমস্ত প্রশংসা আল্লাহর জন্য, যিনি সকল জগতের প্রতিপালক।',
      ),
      Verse(
        number: 3,
        arabicText: 'الرَّحْمَٰنِ الرَّحِيمِ',
        translation: 'The Entirely Merciful, the Especially Merciful,',
        banglaTranslation: 'যিনি পরম করুণাময়, অতি দয়ালু।',
      ),
      Verse(
        number: 4,
        arabicText: 'مَالِكِ يَوْمِ الدِّينِ',
        translation: 'Sovereign of the Day of Recompense.',
        banglaTranslation: 'বিচার দিনের মালিক।',
      ),
      Verse(
        number: 5,
        arabicText: 'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
        translation: 'It is You we worship and You we ask for help.',
        banglaTranslation:
            'আমরা শুধু তোমারই ইবাদত করি এবং শুধু তোমারই সাহায্য চাই।',
      ),
      Verse(
        number: 6,
        arabicText: 'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ',
        translation: 'Guide us to the straight path -',
        banglaTranslation: 'আমাদেরকে সরল পথে পরিচালিত কর।',
      ),
      Verse(
        number: 7,
        arabicText:
            'صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ',
        translation:
            'The path of those upon whom You have bestowed favor, not of those who have earned [Your] anger or of those who are astray.',
        banglaTranslation:
            'সেই সকল লোকের পথ, যাদেরকে তুমি নেয়ামত দান করেছ, তাদের পথ নয় যাদের প্রতি তোমার ক্রোধ নাযিল হয়েছে এবং যারা পথভ্রষ্ট হয়েছে।',
      ),
    ],
  ),
  Surah(
    name: 'الإخلاص',
    englishName: 'Al-Ikhlas (The Sincerity)',
    verseCount: 4,
    verses: [
      Verse(
        number: 1,
        arabicText: 'قُلْ هُوَ اللَّهُ أَحَدٌ',
        translation: 'Say, "He is Allah, [who is] One,',
        banglaTranslation: 'বল, "তিনি আল্লাহ, এক।',
      ),
      Verse(
        number: 2,
        arabicText: 'اللَّهُ الصَّمَدُ',
        translation: 'Allah, the Eternal Refuge.',
        banglaTranslation: 'আল্লাহ অমুখাপেক্ষী।',
      ),
      Verse(
        number: 3,
        arabicText: 'لَمْ يَلِدْ وَلَمْ يُولَدْ',
        translation: 'He neither begets nor is born,',
        banglaTranslation: 'তিনি কাউকে জন্ম দেননি এবং তাকেও জন্ম দেয়া হয়নি।',
      ),
      Verse(
        number: 4,
        arabicText: 'وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ',
        translation: 'Nor is there to Him any equivalent."',
        banglaTranslation: 'এবং তাঁর সমতুল্য কেউ নেই।"',
      ),
    ],
  ),
  Surah(
    name: 'الفلق',
    englishName: 'Al-Falaq (The Daybreak)',
    verseCount: 5,
    verses: [
      Verse(
        number: 1,
        arabicText: 'قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ',
        translation: 'Say, "I seek refuge in the Lord of daybreak',
        banglaTranslation: 'বল, "আমি আশ্রয় চাই উষার প্রভুর কাছে',
      ),
      Verse(
        number: 2,
        arabicText: 'مِن شَرِّ مَا خَلَقَ',
        translation: 'From the evil of that which He created',
        banglaTranslation: 'তিনি যা সৃষ্টি করেছেন তার অনিষ্ট থেকে',
      ),
      Verse(
        number: 3,
        arabicText: 'وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ',
        translation: 'And from the evil of darkness when it settles',
        banglaTranslation: 'এবং অন্ধকারের অনিষ্ট থেকে যখন তা গভীর হয়',
      ),
      Verse(
        number: 4,
        arabicText: 'وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ',
        translation: 'And from the evil of the blowers in knots',
        banglaTranslation: 'এবং গিরায় ফুঁক দিয়ে যাদু করার অনিষ্ট থেকে',
      ),
      Verse(
        number: 5,
        arabicText: 'وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ',
        translation: 'And from the evil of an envier when he envies."',
        banglaTranslation: 'এবং হিংসুকের অনিষ্ট থেকে যখন সে হিংসা করে।"',
      ),
    ],
  ),
  Surah(
    name: 'الناس',
    englishName: 'An-Nas (Mankind)',
    verseCount: 6,
    verses: [
      Verse(
        number: 1,
        arabicText: 'قُلْ أَعُوذُ بِرَبِّ النَّاسِ',
        translation: 'Say, "I seek refuge in the Lord of mankind,',
        banglaTranslation: 'বল, "আমি আশ্রয় চাই মানুষের প্রভুর কাছে,',
      ),
      Verse(
        number: 2,
        arabicText: 'مَلِكِ النَّاسِ',
        translation: 'The Sovereign of mankind,',
        banglaTranslation: 'মানুষের অধিপতি,',
      ),
      Verse(
        number: 3,
        arabicText: 'إِلَٰهِ النَّاسِ',
        translation: 'The God of mankind,',
        banglaTranslation: 'মানুষের উপাস্য,',
      ),
      Verse(
        number: 4,
        arabicText: 'مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ',
        translation: 'From the evil of the retreating whisperer -',
        banglaTranslation: 'কুমন্ত্রণাদাতা, সংকোচনকারীর অনিষ্ট থেকে -',
      ),
      Verse(
        number: 5,
        arabicText: 'الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ',
        translation: 'Who whispers [evil] into the breasts of mankind -',
        banglaTranslation: 'যে কুমন্ত্রণা দেয় মানুষের অন্তরে -',
      ),
      Verse(
        number: 6,
        arabicText: 'مِنَ الْجِنَّةِ وَالنَّاسِ',
        translation: 'From among the jinn and mankind."',
        banglaTranslation: 'জিন ও মানুষের মধ্য থেকে।"',
      ),
    ],
  ),
  Surah(
    name: 'الكوثر',
    englishName: 'Al-Kawthar (Abundance)',
    verseCount: 3,
    verses: [
      Verse(
        number: 1,
        arabicText: 'إِنَّا أَعْطَيْنَاكَ الْكَوْثَرَ',
        translation: 'Indeed, We have granted you, [O Muhammad], al-Kawthar.',
        banglaTranslation:
            'নিশ্চয়ই আমি আপনাকে [হে মুহাম্মদ] কাওসার দান করেছি।',
      ),
      Verse(
        number: 2,
        arabicText: 'فَصَلِّ لِرَبِّكَ وَانْحَرْ',
        translation: 'So pray to your Lord and sacrifice [to Him alone].',
        banglaTranslation:
            'সুতরাং আপনার প্রভুর উদ্দেশ্যে নামাজ পড়ুন এবং কোরবানি করুন।',
      ),
      Verse(
        number: 3,
        arabicText: 'إِنَّ شَانِئَكَ هُوَ الْأَبْتَرُ',
        translation: 'Indeed, your enemy is the one cut off.',
        banglaTranslation: 'নিশ্চয়ই আপনার শত্রুই লেজকাটা (বংশহীন)।',
      ),
    ],
  ),
  Surah(
    name: 'العصر',
    englishName: 'Al-Asr (The Time)',
    verseCount: 3,
    verses: [
      Verse(
        number: 1,
        arabicText: 'وَالْعَصْرِ',
        translation: 'By time,',
        banglaTranslation: 'সময়ের শপথ,',
      ),
      Verse(
        number: 2,
        arabicText: 'إِنَّ الْإِنسَانَ لَفِي خُسْرٍ',
        translation: 'Indeed, mankind is in loss,',
        banglaTranslation: 'নিশ্চয়ই মানুষ ক্ষতির মধ্যে রয়েছে,',
      ),
      Verse(
        number: 3,
        arabicText:
            'إِلَّا الَّذِينَ آمَنُوا وَعَمِلُوا الصَّالِحَاتِ وَتَوَاصَوْا بِالْحَقِّ وَتَوَاصَوْا بِالصَّبْرِ',
        translation:
            'Except for those who have believed and done righteous deeds and advised each other to truth and advised each other to patience.',
        banglaTranslation:
            'তবে তারা ছাড়া যারা বিশ্বাস করে, সৎকর্ম করে এবং একে অপরকে সত্যের উপদেশ দেয় ও একে অপরকে ধৈর্যের উপদেশ দেয়।',
      ),
    ],
  ),
  Surah(
    name: 'النصر',
    englishName: 'An-Nasr (Divine Support)',
    verseCount: 3,
    verses: [
      Verse(
        number: 1,
        arabicText: 'إِذَا جَاءَ نَصْرُ اللَّهِ وَالْفَتْحُ',
        translation: 'When the victory of Allah has come and the conquest,',
        banglaTranslation: 'যখন আল্লাহর সাহায্য ও বিজয় আসবে,',
      ),
      Verse(
        number: 2,
        arabicText:
            'وَرَأَيْتَ النَّاسَ يَدْخُلُونَ فِي دِينِ اللَّهِ أَفْوَاجًا',
        translation:
            'And you see the people entering into the religion of Allah in multitudes,',
        banglaTranslation:
            'এবং আপনি দেখবেন মানুষ দলে দলে আল্লাহর দীনে প্রবেশ করছে,',
      ),
      Verse(
        number: 3,
        arabicText:
            'فَسَبِّحْ بِحَمْدِ رَبِّكَ وَاسْتَغْفِرْهُ ۚ إِنَّهُ كَانَ تَوَّابًا',
        translation:
            'Then exalt [Him] with praise of your Lord and ask forgiveness of Him. Indeed, He is ever Accepting of repentance.',
        banglaTranslation:
            'তখন আপনার প্রভুর প্রশংসার সাথে তাঁর পবিত্রতা বর্ণনা করুন এবং তাঁর কাছে ক্ষমা প্রার্থনা করুন। নিশ্চয়ই তিনি তওবা কবুলকারী।',
      ),
    ],
  ),
  Surah(
    name: 'المسد',
    englishName: 'Al-Masad (The Palm Fiber)',
    verseCount: 5,
    verses: [
      Verse(
        number: 1,
        arabicText: 'تَبَّتْ يَدَا أَبِي لَهَبٍ وَتَبَّ',
        translation: 'May the hands of Abu Lahab be ruined, and ruined is he.',
        banglaTranslation: 'আবু লাহাবের হাত ধ্বংস হোক, এবং সে নিজেও ধ্বংস হোক।',
      ),
      Verse(
        number: 2,
        arabicText: 'مَا أَغْنَىٰ عَنْهُ مَالُهُ وَمَا كَسَبَ',
        translation: 'His wealth will not avail him or that which he gained.',
        banglaTranslation:
            'তার ধন-সম্পদ ও যা সে উপার্জন করেছে তা তার কোন উপকারে আসবে না।',
      ),
      Verse(
        number: 3,
        arabicText: 'سَيَصْلَىٰ نَارًا ذَاتَ لَهَبٍ',
        translation: 'He will [enter to] burn in a Fire of [blazing] flame',
        banglaTranslation: 'সে শীঘ্রই লেলিহান আগুনে প্রবেশ করবে',
      ),
      Verse(
        number: 4,
        arabicText: 'وَامْرَأَتُهُ حَمَّالَةَ الْحَطَبِ',
        translation: 'And his wife [as well] - the carrier of firewood.',
        banglaTranslation: 'এবং তার স্ত্রীও - যে জ্বালানি কাঠ বহন করে।',
      ),
      Verse(
        number: 5,
        arabicText: 'فِي جِيدِهَا حَبْلٌ مِّن مَّسَدٍ',
        translation: 'Around her neck is a rope of [twisted] fiber.',
        banglaTranslation: 'তার গলায় খেজুর আঁশের রশি রয়েছে।',
      ),
    ],
  ),
  Surah(
    name: 'الماعون',
    englishName: 'Al-Maun (Small Kindnesses)',
    verseCount: 7,
    verses: [
      Verse(
        number: 1,
        arabicText: 'أَرَأَيْتَ الَّذِي يُكَذِّبُ بِالدِّينِ',
        translation: 'Have you seen the one who denies the Recompense?',
        banglaTranslation:
            'আপনি কি দেখেছেন সেই ব্যক্তিকে যে বিচার দিবসকে অস্বীকার করে?',
      ),
      Verse(
        number: 2,
        arabicText: 'فَذَٰلِكَ الَّذِي يَدُعُّ الْيَتِيمَ',
        translation: 'For that is the one who drives away the orphan',
        banglaTranslation: 'সে সেই ব্যক্তি যে এতিমকে নিষ্ঠুরভাবে তাড়িয়ে দেয়',
      ),
      Verse(
        number: 3,
        arabicText: 'وَلَا يَحُضُّ عَلَىٰ طَعَامِ الْمِسْكِينِ',
        translation: 'And does not encourage the feeding of the poor.',
        banglaTranslation: 'এবং মিসকিনকে খাবার দেওয়ার জন্য উৎসাহিত করে না।',
      ),
      Verse(
        number: 4,
        arabicText: 'فَوَيْلٌ لِّلْمُصَلِّينَ',
        translation: 'So woe to those who pray',
        banglaTranslation: 'সুতরাং সেই নামাজীদের জন্য দুর্ভোগ',
      ),
      Verse(
        number: 5,
        arabicText: 'الَّذِينَ هُمْ عَن صَلَاتِهِمْ سَاهُونَ',
        translation: '[But] who are heedless of their prayer -',
        banglaTranslation: 'যারা নিজেদের নামাজ সম্পর্কে উদাসীন -',
      ),
      Verse(
        number: 6,
        arabicText: 'الَّذِينَ هُمْ يُرَاءُونَ',
        translation: 'Those who make show [of their deeds]',
        banglaTranslation: 'যারা লোক দেখানোর জন্য [কাজ করে]',
      ),
      Verse(
        number: 7,
        arabicText: 'وَيَمْنَعُونَ الْمَاعُونَ',
        translation: 'And withhold [simple] assistance.',
        banglaTranslation: 'এবং [সাধারণ] সাহায্য প্রদান থেকে বিরত থাকে।',
      ),
    ],
  ),
  Surah(
    name: 'قريش',
    englishName: 'Quraysh (Quraysh)',
    verseCount: 4,
    verses: [
      Verse(
        number: 1,
        arabicText: 'لِإِيلَافِ قُرَيْشٍ',
        translation: 'For the accustomed security of the Quraysh -',
        banglaTranslation: 'কুরাইশের অভ্যস্ত নিরাপত্তার জন্য -',
      ),
      Verse(
        number: 2,
        arabicText: 'إِيلَافِهِمْ رِحْلَةَ الشِّتَاءِ وَالصَّيْفِ',
        translation:
            'Their accustomed security [in] the caravan of winter and summer -',
        banglaTranslation:
            'তাদের অভ্যস্ত নিরাপত্তা [শীত ও গ্রীষ্মের] কাফেলায় -',
      ),
      Verse(
        number: 3,
        arabicText: 'فَلْيَعْبُدُوا رَبَّ هَٰذَا الْبَيْتِ',
        translation: 'Let them worship the Lord of this House,',
        banglaTranslation: 'সুতরাং তারা এই ঘরের প্রভুর ইবাদত করুক,',
      ),
      Verse(
        number: 4,
        arabicText: 'الَّذِي أَطْعَمَهُم مِّن جُوعٍ وَآمَنَهُم مِّنْ خَوْفٍ',
        translation:
            'Who has fed them, [saving them] from hunger and made them safe, [saving them] from fear.',
        banglaTranslation:
            'যিনি তাদেরকে ক্ষুধার সময় খাবার দিয়েছেন এবং ভয়ের হাত থেকে তাদেরকে নিরাপদ করেছেন।',
      ),
    ],
  ),
];
