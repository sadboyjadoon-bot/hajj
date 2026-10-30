import '../models/hajj_models.dart';

const hajjDays = <HajjDay>[
  HajjDay(
    day: 8,
    title: 'A day of preparation',
    location: 'Mina',
    summary: 'Enter Ihram for Hajj if you are performing Tamattu, then travel to Mina. Spend the day in remembrance and prepare for the standing at Arafat.',
    steps: [
      RitualStep(
        title: 'Enter Ihram for Hajj',
        type: RitualType.wajib,
        description: 'For Tamattu, make the intention and begin Talbiyah from your place in Makkah. Qiran and Ifrad pilgrims are already in Ihram.',
      ),
      RitualStep(
        title: 'Travel to Mina',
        type: RitualType.sunnah,
        description: 'Proceed to Mina and pray Dhuhr, Asr, Maghrib, Isha, and Fajr there. Details of shortening and combining prayers vary by school.',
      ),
      RitualStep(
        title: 'Talbiyah and remembrance',
        type: RitualType.sunnah,
        description: 'Recite the Talbiyah often, make dua, rest, and prepare for the next day.',
      ),
    ],
  ),
  HajjDay(
    day: 9,
    title: 'The great standing',
    location: 'Arafat & Muzdalifah',
    summary: 'Wuquf at Arafat is the central pillar of Hajj. After sunset, travel calmly to Muzdalifah and spend the night there.',
    steps: [
      RitualStep(
        title: 'Stand at Arafat',
        type: RitualType.pillar,
        description: 'Be within the boundary of Arafat during its valid time, from midday until dawn on the 10th. Make abundant dua.',
      ),
      RitualStep(
        title: 'Leave Arafat after sunset',
        type: RitualType.wajib,
        description: 'Depart with calm and dignity after sunset, following your group and official crowd-safety instructions.',
      ),
      RitualStep(
        title: 'Spend the night at Muzdalifah',
        type: RitualType.wajib,
        description: 'Pray as instructed by your scholar, rest, and collect pebbles if appropriate. Rules for the vulnerable and those with a valid excuse differ.',
      ),
    ],
  ),
  HajjDay(
    day: 10,
    title: 'The day of sacrifice',
    location: 'Mina & Makkah',
    summary: 'Complete the major rites of the day in the order advised by your scholar and Hajj group. Crowd conditions can change the safest sequence.',
    steps: [
      RitualStep(
        title: 'Stone Jamrat al-Aqabah',
        type: RitualType.wajib,
        description: 'Cast seven pebbles, one at a time. Follow the official route and do not push or throw from unsafe positions.',
      ),
      RitualStep(
        title: 'Offer the hady, when due',
        type: RitualType.wajib,
        description: 'Hady is due for many Tamattu and Qiran pilgrims who are able; this does not apply identically to every pilgrim. Ask a qualified scholar.',
      ),
      RitualStep(
        title: 'Shave or trim the hair',
        type: RitualType.wajib,
        description: 'Men shave or shorten their hair; women trim a small portion. The ruling and sequence should be checked with your school.',
      ),
      RitualStep(
        title: 'Tawaf al-Ifadah and Sa’i',
        type: RitualType.pillar,
        description: 'Perform Tawaf al-Ifadah. Sa’i is required when due for your Hajj type. The order and timing have school-specific details.',
      ),
    ],
  ),
  HajjDay(
    day: 11,
    title: 'Days of remembrance',
    location: 'Mina',
    summary: 'Remain in Mina and stone the three Jamarat after midday, observing the prescribed order and your group’s safe schedule.',
    steps: [
      RitualStep(
        title: 'Stay in Mina',
        type: RitualType.wajib,
        description: 'Remain in Mina for the night where required. Excuses and the exact obligation have details across schools.',
      ),
      RitualStep(
        title: 'Stone the three Jamarat',
        type: RitualType.wajib,
        description: 'After midday, stone the small, middle, then large Jamrah, seven pebbles each. Make dua after the first two where safe.',
      ),
    ],
  ),
  HajjDay(
    day: 12,
    title: 'A choice to depart',
    location: 'Mina',
    summary: 'Stone the Jamarat after midday. You may depart Mina before sunset for an early departure, if your school and circumstances permit.',
    steps: [
      RitualStep(
        title: 'Stone the three Jamarat',
        type: RitualType.wajib,
        description: 'After midday, stone each Jamrah with seven pebbles in order, while keeping clear of dangerous crowding.',
      ),
      RitualStep(
        title: 'Depart or remain in Mina',
        type: RitualType.optional,
        description: 'An early departure is permitted in the Qur’anic guidance; pilgrims who remain complete the rites of the 13th.',
      ),
    ],
  ),
  HajjDay(
    day: 13,
    title: 'Completing the journey',
    location: 'Mina & Makkah',
    summary: 'If you remain in Mina, stone the three Jamarat after midday. Before leaving Makkah, plan your farewell Tawaf as required.',
    steps: [
      RitualStep(
        title: 'Final stoning',
        type: RitualType.wajib,
        description: 'For those staying, stone the three Jamarat after midday in order. Follow official timing and safety instructions.',
      ),
      RitualStep(
        title: 'Farewell Tawaf',
        type: RitualType.wajib,
        description: 'Perform Tawaf al-Wada before departure when required. There are exemptions, including for menstruating women, with school-specific details.',
      ),
    ],
  ),
];

const ritualChecklist = <ChecklistItem>[
  ChecklistItem(
    id: 'ihram',
    title: 'Make intention and enter Ihram',
    category: 'Before Hajj',
    type: RitualType.wajib,
  ),
  ChecklistItem(
    id: 'mina',
    title: 'Travel to Mina and settle in',
    category: '8 Dhul Hijjah',
    type: RitualType.sunnah,
  ),
  ChecklistItem(
    id: 'arafat',
    title: 'Be present at Arafat during its valid time',
    category: '9 Dhul Hijjah',
    type: RitualType.pillar,
  ),
  ChecklistItem(
    id: 'muzdalifah',
    title: 'Proceed to Muzdalifah after sunset',
    category: '9 Dhul Hijjah',
    type: RitualType.wajib,
  ),
  ChecklistItem(
    id: 'aqabah',
    title: 'Stone Jamrat al-Aqabah',
    category: '10 Dhul Hijjah',
    type: RitualType.wajib,
  ),
  ChecklistItem(
    id: 'hady',
    title: 'Arrange hady if it is due for your Hajj',
    category: '10 Dhul Hijjah',
    type: RitualType.wajib,
  ),
  ChecklistItem(
    id: 'hair',
    title: 'Shave or shorten hair',
    category: '10 Dhul Hijjah',
    type: RitualType.wajib,
  ),
  ChecklistItem(
    id: 'ifadah',
    title: 'Complete Tawaf al-Ifadah and Sa’i as due',
    category: '10 Dhul Hijjah',
    type: RitualType.pillar,
  ),
  ChecklistItem(
    id: 'rami11',
    title: 'Stone all three Jamarat',
    category: '11 Dhul Hijjah',
    type: RitualType.wajib,
  ),
  ChecklistItem(
    id: 'rami12',
    title: 'Stone all three Jamarat',
    category: '12 Dhul Hijjah',
    type: RitualType.wajib,
  ),
  ChecklistItem(
    id: 'rami13',
    title: 'Complete final stoning if remaining',
    category: '13 Dhul Hijjah',
    type: RitualType.optional,
  ),
  ChecklistItem(
    id: 'wada',
    title: 'Perform farewell Tawaf when required',
    category: 'Before departure',
    type: RitualType.wajib,
  ),
];

const packingItems = <ChecklistItem>[
  ChecklistItem(
    id: 'ihram-cloth',
    title: 'Ihram garments (spare set)',
    category: 'Clothing',
    type: RitualType.optional,
  ),
  ChecklistItem(
    id: 'sandals',
    title: 'Comfortable permitted sandals',
    category: 'Clothing',
    type: RitualType.optional,
  ),
  ChecklistItem(
    id: 'prayer-mat',
    title: 'Lightweight prayer mat',
    category: 'Worship',
    type: RitualType.optional,
  ),
  ChecklistItem(
    id: 'quran',
    title: 'Qur’an or offline reading app',
    category: 'Worship',
    type: RitualType.optional,
  ),
  ChecklistItem(
    id: 'medication',
    title: 'Personal medication and prescriptions',
    category: 'Health',
    type: RitualType.optional,
  ),
  ChecklistItem(
    id: 'sun',
    title: 'Unscented sunscreen and hydration supplies',
    category: 'Health',
    type: RitualType.optional,
  ),
  ChecklistItem(
    id: 'passport',
    title: 'Passport, visa, and Nusuk details',
    category: 'Documents',
    type: RitualType.optional,
  ),
  ChecklistItem(
    id: 'contacts',
    title: 'Group leader and emergency contacts',
    category: 'Documents',
    type: RitualType.optional,
  ),
  ChecklistItem(
    id: 'charger',
    title: 'Phone charger and power bank',
    category: 'Essentials',
    type: RitualType.optional,
  ),
  ChecklistItem(
    id: 'bag',
    title: 'Small labelled day bag',
    category: 'Essentials',
    type: RitualType.optional,
  ),
];

const duas = <Dua>[
  Dua(
    id: 'talbiyah',
    title: 'The Talbiyah',
    arabic: 'لَبَّيْكَ اللَّهُمَّ لَبَّيْكَ، لَبَّيْكَ لَا شَرِيكَ لَكَ لَبَّيْكَ، إِنَّ الْحَمْدَ وَالنِّعْمَةَ لَكَ وَالْمُلْكَ، لَا شَرِيكَ لَكَ',
    transliteration: 'Labbayka Allahumma labbayk. Labbayka la sharika laka labbayk. Innal-hamda wan-ni‘mata laka wal-mulk. La sharika lak.',
    translation: 'Here I am, O Allah, here I am. You have no partner; here I am. Surely all praise, grace, and dominion belong to You. You have no partner.',
    reference: 'Sahih al-Bukhari 1549; Sahih Muslim 1184',
  ),
  Dua(
    id: 'arafah',
    title: 'A supplication for Arafah',
    arabic: 'لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ',
    transliteration: 'La ilaha illallahu wahdahu la sharika lah, lahul-mulku wa lahul-hamdu wa huwa ‘ala kulli shay’in qadir.',
    translation: 'There is no god but Allah alone, without partner. His is the dominion and His is all praise, and He has power over all things.',
    reference: 'Jami‘ at-Tirmidhi 3585',
  ),
  Dua(
    id: 'good',
    title: 'Good in this life and the next',
    arabic: 'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
    transliteration: 'Rabbana atina fid-dunya hasanatan wa fil-akhirati hasanatan wa qina ‘adhaban-nar.',
    translation: 'Our Lord, grant us good in this world and good in the Hereafter, and protect us from the punishment of the Fire.',
    reference: 'Qur’an 2:201',
  ),
  Dua(
    id: 'forgiveness',
    title: 'Seeking forgiveness',
    arabic: 'رَبَّنَا ظَلَمْنَا أَنْفُسَنَا وَإِنْ لَمْ تَغْفِرْ لَنَا وَتَرْحَمْنَا لَنَكُونَنَّ مِنَ الْخَاسِرِينَ',
    transliteration: 'Rabbana zalamna anfusana wa in lam taghfir lana wa tarhamna lanakunanna minal-khasirin.',
    translation: 'Our Lord, we have wronged ourselves. If You do not forgive us and have mercy on us, we will surely be among the losers.',
    reference: 'Qur’an 7:23',
  ),
];

const masnoonAzkar = <Dua>[
  Dua(
    id: 'azkar-ikhlas',
    title: 'Surah al-Ikhlas',
    category: 'Morning & evening',
    repetitions: 3,
    arabic: 'قُلْ هُوَ اللَّهُ أَحَدٌ ۝ اللَّهُ الصَّمَدُ ۝ لَمْ يَلِدْ وَلَمْ يُولَدْ ۝ وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ',
    transliteration: 'Qul huwa Allahu ahad. Allahu-s-samad. Lam yalid wa lam yulad. Wa lam yakun lahu kufuwan ahad.',
    translation: 'Say: He is Allah, the One; Allah, the Eternal Refuge. He neither begets nor is born, nor is there to Him any equivalent.',
    reference: 'Qur’an 112; Abu Dawud 5082; Jami‘ at-Tirmidhi 3575',
  ),
  Dua(
    id: 'azkar-falaq',
    title: 'Surah al-Falaq',
    category: 'Morning & evening',
    repetitions: 3,
    arabic: 'قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ ۝ مِن شَرِّ مَا خَلَقَ ۝ وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ ۝ وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ ۝ وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ',
    transliteration: 'Qul a‘udhu bi-rabbi-l-falaq. Min sharri ma khalaq. Wa min sharri ghasiqin idha waqab. Wa min sharrin-naffathati fil-‘uqad. Wa min sharri hasidin idha hasad.',
    translation: 'Say: I seek refuge in the Lord of daybreak, from the evil of what He created, from the evil of darkness when it settles, from the evil of those who blow on knots, and from the evil of an envier when they envy.',
    reference: 'Qur’an 113; Abu Dawud 5082; Jami‘ at-Tirmidhi 3575',
  ),
  Dua(
    id: 'azkar-nas',
    title: 'Surah an-Nas',
    category: 'Morning & evening',
    repetitions: 3,
    arabic: 'قُلْ أَعُوذُ بِرَبِّ النَّاسِ ۝ مَلِكِ النَّاسِ ۝ إِلَٰهِ النَّاسِ ۝ مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ ۝ الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ ۝ مِنَ الْجِنَّةِ وَالنَّاسِ',
    transliteration: 'Qul a‘udhu bi-rabbi-n-nas. Maliki-n-nas. Ilahi-n-nas. Min sharri-l-waswasi-l-khannas. Alladhi yuwaswisu fi suduri-n-nas. Mina-l-jinnati wa-n-nas.',
    translation: 'Say: I seek refuge in the Lord of mankind, the Sovereign of mankind, the God of mankind, from the evil of the retreating whisperer, who whispers in the hearts of mankind, among jinn and mankind.',
    reference: 'Qur’an 114; Abu Dawud 5082; Jami‘ at-Tirmidhi 3575',
  ),
  Dua(
    id: 'azkar-sayyid-istighfar',
    title: 'Sayyid al-Istighfar',
    category: 'Morning & evening',
    repetitions: 1,
    arabic: 'اللَّهُمَّ أَنْتَ رَبِّي لَا إِلَهَ إِلَّا أَنْتَ، خَلَقْتَنِي وَأَنَا عَبْدُكَ، وَأَنَا عَلَى عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ، أَعُوذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ، أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ، وَأَبُوءُ بِذَنْبِي، فَاغْفِرْ لِي، فَإِنَّهُ لَا يَغْفِرُ الذُّنُوبَ إِلَّا أَنْتَ',
    transliteration: 'Allahumma anta Rabbi, la ilaha illa Anta. Khalaqtani wa ana ‘abduka, wa ana ‘ala ‘ahdika wa wa‘dika mastata‘t. A‘udhu bika min sharri ma sana‘t. Abu’u laka bi-ni‘matika ‘alayya, wa abu’u bi-dhanbi, faghfir li, fa-innahu la yaghfiru-dh-dhunuba illa Anta.',
    translation: 'O Allah, You are my Lord; there is no god except You. You created me and I am Your servant. I uphold Your covenant and promise as best I can. I seek refuge in You from the evil I have done. I acknowledge Your favour upon me and acknowledge my sin, so forgive me, for none forgives sins except You.',
    reference: 'Sahih al-Bukhari 6306',
  ),
  Dua(
    id: 'azkar-protection',
    title: 'In the name of Allah, with whose name nothing harms',
    category: 'Morning & evening',
    repetitions: 3,
    arabic: 'بِسْمِ اللَّهِ الَّذِي لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ وَهُوَ السَّمِيعُ الْعَلِيمُ',
    transliteration: 'Bismillahi-lladhi la yadurru ma‘a-smihi shay’un fi-l-ardi wa la fi-s-sama’, wa huwa-s-sami‘u-l-‘alim.',
    translation: 'In the name of Allah, with whose name nothing on earth or in heaven can cause harm; He is the All-Hearing, the All-Knowing.',
    reference: 'Abu Dawud 5088; Jami‘ at-Tirmidhi 3388',
  ),
  Dua(
    id: 'azkar-contentment',
    title: 'Contentment with Allah, Islam, and the Prophet',
    category: 'Morning & evening',
    repetitions: 3,
    arabic: 'رَضِيتُ بِاللَّهِ رَبًّا، وَبِالْإِسْلَامِ دِينًا، وَبِمُحَمَّدٍ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ نَبِيًّا',
    transliteration: 'Raditu billahi Rabban, wa bil-Islami dinan, wa bi-Muhammadin sallallahu ‘alayhi wa sallama Nabiyyan.',
    translation: 'I am pleased with Allah as my Lord, Islam as my religion, and Muhammad ﷺ as my Prophet.',
    reference: 'Abu Dawud 5072; Jami‘ at-Tirmidhi 3389',
  ),
  Dua(
    id: 'azkar-morning',
    title: 'O Allah, by You we enter the morning',
    category: 'Morning',
    repetitions: 1,
    arabic: 'اللَّهُمَّ بِكَ أَصْبَحْنَا، وَبِكَ أَمْسَيْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ، وَإِلَيْكَ النُّشُورُ',
    transliteration: 'Allahumma bika asbahna, wa bika amsayna, wa bika nahya, wa bika namutu, wa ilayka-n-nushur.',
    translation: 'O Allah, by You we enter the morning, by You we enter the evening, by You we live, by You we die, and to You is the resurrection.',
    reference: 'Jami‘ at-Tirmidhi 3391; Abu Dawud 5068',
  ),
  Dua(
    id: 'azkar-evening',
    title: 'O Allah, by You we enter the evening',
    category: 'Evening',
    repetitions: 1,
    arabic: 'اللَّهُمَّ بِكَ أَمْسَيْنَا، وَبِكَ أَصْبَحْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ، وَإِلَيْكَ الْمَصِيرُ',
    transliteration: 'Allahumma bika amsayna, wa bika asbahna, wa bika nahya, wa bika namutu, wa ilayka-l-masir.',
    translation: 'O Allah, by You we enter the evening, by You we enter the morning, by You we live, by You we die, and to You is the final return.',
    reference: 'Jami‘ at-Tirmidhi 3391; Abu Dawud 5068',
  ),
  Dua(
    id: 'azkar-tasbih',
    title: 'Glory and praise be to Allah',
    category: 'Anytime',
    repetitions: 100,
    arabic: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
    transliteration: 'Subhan-Allahi wa bi-hamdih.',
    translation: 'Glory and praise be to Allah.',
    reference: 'Sahih Muslim 2692',
  ),
];

const prayerTimes = <({String name, String time, String note})>[
  (name: 'Fajr', time: '04:32', note: 'Dawn prayer'),
  (name: 'Dhuhr', time: '12:18', note: 'Midday prayer'),
  (name: 'Asr', time: '15:42', note: 'Afternoon prayer'),
  (name: 'Maghrib', time: '18:51', note: 'Sunset prayer'),
  (name: 'Isha', time: '20:21', note: 'Night prayer'),
];

const guideItems = <({String title, String subtitle, String detail})>[
  (
    title: 'Ihram',
    subtitle: 'Intention, attire & restrictions',
    detail: 'Make the intention for your chosen Hajj type at or before the miqat and begin the Talbiyah. Ihram is the sacred state, not just the clothing. Avoid its prohibited acts; rules differ for men and women and details should be confirmed with your scholar.',
  ),
  (
    title: 'Tawaf & Sa’i',
    subtitle: 'Seven circuits and seven traversals',
    detail: 'For Tawaf, begin aligned with the Black Stone, keep the Ka‘bah to your left, and complete seven circuits. Sa’i is seven traversals between Safa and Marwah, beginning at Safa. Accessibility, crowd flow, and the precise rulings around purity have school-specific detail.',
  ),
  (
    title: 'Wuquf at Arafat',
    subtitle: 'The heart of Hajj',
    detail: 'The Prophet ﷺ said, “Hajj is Arafah.” Ensure you are within Arafat during the valid period, which extends from midday on the 9th to dawn on the 10th. Spend the time in dua and remembrance; do not leave before sunset unless your scholar advises otherwise for a valid need.',
  ),
  (
    title: 'Muzdalifah',
    subtitle: 'Night of the 9th',
    detail: 'Travel from Arafat after sunset. Follow your Hajj group’s arrangements for prayer, rest, and pebbles. The required duration and concessions for women, older pilgrims, and those with needs are discussed differently by jurists.',
  ),
  (
    title: 'Rami al-Jamarat',
    subtitle: 'Stoning with care',
    detail: 'Use only the designated route and timing from Saudi authorities. Cast pebbles individually, never throw shoes or objects, and do not force through crowds. A proxy may be permitted for a genuine inability; ask your scholar and group leader.',
  ),
  (
    title: 'Common mistakes & safety',
    subtitle: 'Move with knowledge and gentleness',
    detail: 'Do not assume every pilgrim has the same Hajj type, obligation, or sequence. Avoid pushing, blocking routes, photographing others without consent, and relying on unsourced dua formulas. Your group leader’s safety instructions take priority in crowded areas.',
  ),
];
