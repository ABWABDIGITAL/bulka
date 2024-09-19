class CountryHelpers {
  static const Map<String, String> _countryCodes = {
    "Afghanistan": "af",
    "Albania": "al",
    "Algeria": "dz",
    "Andorra": "ad",
    "Angola": "ao",
    "Argentina": "ar",
    "Armenia": "am",
    "Australia": "au",
    "Austria": "at",
    "Azerbaijan": "az",
    "Bahamas": "bs",
    "Bahrain": "bh",
    "Bangladesh": "bd",
    "Barbados": "bb",
    "Belarus": "by",
    "Belgium": "be",
    "Belize": "bz",
    "Benin": "bj",
    "Bhutan": "bt",
    "Bolivia": "bo",
    "Bosnia and Herzegovina": "ba",
    "Botswana": "bw",
    "Brazil": "br",
    "Brunei": "bn",
    "Bulgaria": "bg",
    "Burkina Faso": "bf",
    "Burundi": "bi",
    "Cambodia": "kh",
    "Cameroon": "cm",
    "Canada": "ca",
    "Cape Verde": "cv",
    "Central African Republic": "cf",
    "Chad": "td",
    "Chile": "cl",
    "China": "cn",
    "Colombia": "co",
    "Comoros": "km",
    "Congo": "cg",
    "Congo, Democratic Republic of the": "cd",
    "Costa Rica": "cr",
    "Croatia": "hr",
    "Cuba": "cu",
    "Cyprus": "cy",
    "Czech Republic": "cz",
    "Denmark": "dk",
    "Djibouti": "dj",
    "Dominica": "dm",
    "Dominican Republic": "do",
    "Ecuador": "ec",
    "Egypt": "eg",
    "El Salvador": "sv",
    "Equatorial Guinea": "gq",
    "Eritrea": "er",
    "Estonia": "ee",
    "Eswatini": "sz",
    "Ethiopia": "et",
    "Fiji": "fj",
    "Finland": "fi",
    "France": "fr",
    "Gabon": "ga",
    "Gambia": "gm",
    "Georgia": "ge",
    "Germany": "de",
    "Ghana": "gh",
    "Greece": "gr",
    "Grenada": "gd",
    "Guatemala": "gt",
    "Guinea": "gn",
    "Guinea-Bissau": "gw",
    "Guyana": "gy",
    "Haiti": "ht",
    "Honduras": "hn",
    "Hungary": "hu",
    "Iceland": "is",
    "India": "in",
    "Indonesia": "id",
    "Iran": "ir",
    "Iraq": "iq",
    "Ireland": "ie",
    "Israel": "il",
    "Italy": "it",
    "Ivory Coast": "ci",
    "Jamaica": "jm",
    "Japan": "jp",
    "Jordan": "jo",
    "Kazakhstan": "kz",
    "Kenya": "ke",
    "Kiribati": "ki",
    "Kuwait": "kw",
    "Kyrgyzstan": "kg",
    "Laos": "la",
    "Latvia": "lv",
    "Lebanon": "lb",
    "Lesotho": "ls",
    "Liberia": "lr",
    "Libya": "ly",
    "Liechtenstein": "li",
    "Lithuania": "lt",
    "Luxembourg": "lu",
    "Madagascar": "mg",
    "Malawi": "mw",
    "Malaysia": "my",
    "Maldives": "mv",
    "Mali": "ml",
    "Malta": "mt",
    "Mauritania": "mr",
    "Mauritius": "mu",
    "Mexico": "mx",
    "Micronesia": "fm",
    "Moldova": "md",
    "Monaco": "mc",
    "Mongolia": "mn",
    "Montenegro": "me",
    "Morocco": "ma",
    "Mozambique": "mz",
    "Myanmar": "mm",
    "Namibia": "na",
    "Nauru": "nr",
    "Nepal": "np",
    "Netherlands": "nl",
    "New Zealand": "nz",
    "Nicaragua": "ni",
    "Niger": "ne",
    "Nigeria": "ng",
    "North Macedonia": "mk",
    "Norway": "no",
    "Oman": "om",
    "Pakistan": "pk",
    "Palau": "pw",
    "Panama": "pa",
    "Papua New Guinea": "pg",
    "Paraguay": "py",
    "Peru": "pe",
    "Philippines": "ph",
    "Poland": "pl",
    "Portugal": "pt",
    "Qatar": "qa",
    "Romania": "ro",
    "Russia": "ru",
    "Rwanda": "rw",
    "Saint Kitts and Nevis": "kn",
    "Saint Lucia": "lc",
    "Saint Vincent and the Grenadines": "vc",
    "Samoa": "ws",
    "San Marino": "sm",
    "Sao Tome and Principe": "st",
    "Saudi Arabia": "sa",
    "Senegal": "sn",
    "Serbia": "rs",
    "Seychelles": "sc",
    "Sierra Leone": "sl",
    "Singapore": "sg",
    "Slovakia": "sk",
    "Slovenia": "si",
    "Solomon Islands": "sb",
    "Somalia": "so",
    "South Africa": "za",
    "South Sudan": "ss",
    "Spain": "es",
    "Sri Lanka": "lk",
    "Sudan": "sd",
    "Suriname": "sr",
    "Sweden": "se",
    "Switzerland": "ch",
    "Syria": "sy",
    "Taiwan": "tw",
    "Tajikistan": "tj",
    "Tanzania": "tz",
    "Thailand": "th",
    "Togo": "tg",
    "Tonga": "to",
    "Trinidad and Tobago": "tt",
    "Tunisia": "tn",
    "Turkey": "tr",
    "Turkmenistan": "tm",
    "Tuvalu": "tv",
    "Uganda": "ug",
    "Ukraine": "ua",
    "United Arab Emirates": "ae",
    "United Kingdom": "gb",
    "United States": "us",
    "Uruguay": "uy",
    "Uzbekistan": "uz",
    "Vanuatu": "vu",
    "Vatican City": "va",
    "Venezuela": "ve",
    "Vietnam": "vn",
    "Yemen": "ye",
    "Zambia": "zm",
    "Zimbabwe": "zw"
  };
  static const Map<String, String> _dialCodeToCountryCode = {
    "1": "us", // United States
    "20": "eg", // Egypt
    "30": "gr", // Greece
    "31": "nl", // Netherlands
    "32": "be", // Belgium
    "33": "fr", // France
    "34": "es", // Spain
    "36": "hu", // Hungary
    "39": "it", // Italy
    "40": "ro", // Romania
    "41": "ch", // Switzerland
    "43": "at", // Austria
    "44": "gb", // United Kingdom
    "45": "dk", // Denmark
    "46": "se", // Sweden
    "47": "no", // Norway
    "48": "pl", // Poland
    "49": "de", // Germany
    "52": "mx", // Mexico
    "53": "cu", // Cuba
    "54": "ar", // Argentina
    "55": "br", // Brazil
    "56": "cl", // Chile
    "57": "co", // Colombia
    "58": "ve", // Venezuela
    "60": "my", // Malaysia
    "61": "au", // Australia
    "62": "id", // Indonesia
    "63": "ph", // Philippines
    "64": "nz", // New Zealand
    "65": "sg", // Singapore
    "66": "th", // Thailand
    "81": "jp", // Japan
    "82": "kr", // South Korea
    "84": "vn", // Vietnam
    "86": "cn", // China
    "90": "tr", // Turkey
    "91": "in", // India
    "92": "pk", // Pakistan
    "93": "af", // Afghanistan
    "94": "lk", // Sri Lanka
    "95": "mm", // Myanmar
    "98": "ir", // Iran
    "211": "ss", // South Sudan
    "212": "ma", // Morocco
    "213": "dz", // Algeria
    "216": "tn", // Tunisia
    "218": "ly", // Libya
    "220": "gm", // Gambia
    "221": "sn", // Senegal
    "222": "mr", // Mauritania
    "223": "ml", // Mali
    "224": "gn", // Guinea
    "225": "ci", // Ivory Coast
    "226": "bf", // Burkina Faso
    "227": "ne", // Niger
    "228": "tg", // Togo
    "229": "bj", // Benin
    "230": "mu", // Mauritius
    "231": "lr", // Liberia
    "232": "sl", // Sierra Leone
    "233": "gh", // Ghana
    "234": "ng", // Nigeria
    "235": "td", // Chad
    "236": "cf", // Central African Republic
    "237": "cm", // Cameroon
    "238": "cv", // Cape Verde
    "239": "st", // Sao Tome and Principe
    "240": "gq", // Equatorial Guinea
    "241": "ga", // Gabon
    "242": "cg", // Congo
    "243": "cd", // Congo, Democratic Republic of the
    "244": "ao", // Angola
    "245": "gw", // Guinea-Bissau
    "246": "io", // British Indian Ocean Territory
    "248": "sc", // Seychelles
    "249": "sd", // Sudan
    "250": "rw", // Rwanda
    "251": "et", // Ethiopia
    "252": "so", // Somalia
    "253": "dj", // Djibouti
    "254": "ke", // Kenya
    "255": "tz", // Tanzania
    "256": "ug", // Uganda
    "257": "bi", // Burundi
    "258": "mz", // Mozambique
    "260": "zm", // Zambia
    "261": "mg", // Madagascar
    "262": "re", // Reunion
    "263": "zw", // Zimbabwe
    "264": "na", // Namibia
    "265": "mw", // Malawi
    "266": "ls", // Lesotho
    "267": "bw", // Botswana
    "268": "sz", // Eswatini
    "269": "km", // Comoros
    "290": "sh", // Saint Helena
    "291": "er", // Eritrea
    "297": "aw", // Aruba
    "298": "fo", // Faroe Islands
    "299": "gl", // Greenland
    "350": "gi", // Gibraltar
    "351": "pt", // Portugal
    "352": "lu", // Luxembourg
    "353": "ie", // Ireland
    "354": "is", // Iceland
    "355": "al", // Albania
    "356": "mt", // Malta
    "357": "cy", // Cyprus
    "358": "fi", // Finland
    "359": "bg", // Bulgaria
    "370": "lt", // Lithuania
    "371": "lv", // Latvia
    "372": "ee", // Estonia
    "373": "md", // Moldova
    "374": "am", // Armenia
    "375": "by", // Belarus
    "376": "ad", // Andorra
    "377": "mc", // Monaco
    "378": "sm", // San Marino
    "380": "ua", // Ukraine
    "381": "rs", // Serbia
    "382": "me", // Montenegro
    "385": "hr", // Croatia
    "386": "si", // Slovenia
    "387": "ba", // Bosnia and Herzegovina
    "389": "mk", // North Macedonia
    "420": "cz", // Czech Republic
    "421": "sk", // Slovakia
    "423": "li", // Liechtenstein
    "500": "fk", // Falkland Islands
    "501": "bz", // Belize
    "502": "gt", // Guatemala
    "503": "sv", // El Salvador
    "504": "hn", // Honduras
    "505": "ni", // Nicaragua
    "506": "cr", // Costa Rica
    "507": "pa", // Panama
    "508": "pm", // Saint Pierre and Miquelon
    "509": "ht", // Haiti
    "590": "gp", // Guadeloupe
    "591": "bo", // Bolivia
    "592": "gy", // Guyana
    "593": "ec", // Ecuador
    "594": "gf", // French Guiana
    "595": "py", // Paraguay
    "596": "mq", // Martinique
    "597": "sr", // Suriname
    "598": "uy", // Uruguay
    "599": "cw", // Curacao
    "670": "tl", // East Timor
    "672": "nf", // Norfolk Island
    "673": "bn", // Brunei
    "674": "nr", // Nauru
    "675": "pg", // Papua New Guinea
    "676": "to", // Tonga
    "677": "sb", // Solomon Islands
    "678": "vu", // Vanuatu
    "679": "fj", // Fiji
    "680": "pw", // Palau
    "681": "wf", // Wallis and Futuna
    "682": "ck", // Cook Islands
    "683": "nu", // Niue
    "685": "ws", // Samoa
    "686": "ki", // Kiribati
    "687": "nc", // New Caledonia
    "688": "tv", // Tuvalu
    "689": "pf", // French Polynesia
    "690": "tk", // Tokelau
    "691": "fm", // Micronesia
    "692": "mh", // Marshall Islands
    "850": "kp", // North Korea
    "852": "hk", // Hong Kong
    "853": "mo", // Macau
    "855": "kh", // Cambodia
    "856": "la", // Laos
    "880": "bd", // Bangladesh
    "886": "tw", // Taiwan
    "960": "mv", // Maldives
    "961": "lb", // Lebanon
    "962": "jo", // Jordan
    "963": "sy", // Syria
    "964": "iq", // Iraq
    "965": "kw", // Kuwait
    "966": "sa", // Saudi Arabia
    "967": "ye", // Yemen
    "968": "om", // Oman
    "971": "ae", // United Arab Emirates
    "972": "il", // Israel
    "973": "bh", // Bahrain
    "974": "qa", // Qatar
    "975": "bt", // Bhutan
    "976": "mn", // Mongolia
    "977": "np", // Nepal
    "992": "tj", // Tajikistan
    "993": "tm", // Turkmenistan
    "994": "az", // Azerbaijan
    "995": "ge", // Georgia
    "996": "kg", // Kyrgyzstan
    "998": "uz", // Uzbekistan
  };

  static String getCountryCodeByName(String countryName) {
    String lowerCaseCountryName = countryName.toLowerCase();

    return _countryCodes.entries
        .firstWhere(
          (entry) => entry.key.toLowerCase() == lowerCaseCountryName,
          orElse: () => const MapEntry('unknown', 'tr'),
        )
        .value;
  }

  static String getCountryCodeByDialCode(String dialCode) {
    return _dialCodeToCountryCode[dialCode] ?? 'eg';
  }
}
