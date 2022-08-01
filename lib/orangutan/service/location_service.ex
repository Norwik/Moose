# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Orangutan.Service.LocationService do
  @moduledoc """
  Location Service Module
  """

  @doc """
  Validate a Country By ID
  """
  def validate_country_by_id(country_id) do
    country_id in get_countries_ids()
  end

  @doc """
  Validate a Country By Name
  """
  def validate_country_by_name(country_name) do
    country_name in get_countries_name()
  end

  @doc """
  Get Countries IDs
  """
  def get_countries_ids() do
    get_countries() |> Map.keys() |> Enum.map(&to_string/1)
  end

  @doc """
  Get Countries Names
  """
  def get_countries_name() do
    get_countries() |> Map.values() |> Enum.map(&to_string/1)
  end

  @doc """
  Get Countries List
  """
  def get_countries() do
    %{
      afghanistan: "Afghanistan",
      albania: "Albania",
      algeria: "Algeria",
      andorra: "Andorra",
      angola: "Angola",
      antigua_and_barbuda: "Antigua and Barbuda",
      argentina: "Argentina",
      armenia: "Armenia",
      australia: "Australia",
      austria: "Austria",
      azerbaijan: "Azerbaijan",
      bahamas: "Bahamas",
      bahrain: "Bahrain",
      bangladesh: "Bangladesh",
      barbados: "Barbados",
      belarus: "Belarus",
      belgium: "Belgium",
      belize: "Belize",
      benin: "Benin",
      bhutan: "Bhutan",
      bolivia: "Bolivia",
      bosnia_and_herzegovina: "Bosnia and Herzegovina",
      botswana: "Botswana",
      brazil: "Brazil",
      brunei: "Brunei",
      bulgaria: "Bulgaria",
      burkina_faso: "Burkina Faso",
      burundi: "Burundi",
      cote_divoire: "Cote d'Ivoire",
      cabo_verde: "Cabo Verde",
      cambodia: "Cambodia",
      cameroon: "Cameroon",
      canada: "Canada",
      central_african_republic: "Central African Republic",
      chad: "Chad",
      chile: "Chile",
      china: "China",
      colombia: "Colombia",
      comoros: "Comoros",
      congo: "Congo",
      costa_rica: "Costa Rica",
      croatia: "Croatia",
      cuba: "Cuba",
      cyprus: "Cyprus",
      czech_republic: "Czech Republic",
      democratic_republic_of_the_congo: "Democratic Republic of the Congo",
      denmark: "Denmark",
      djibouti: "Djibouti",
      dominica: "Dominica",
      dominican_republic: "Dominican Republic",
      ecuador: "Ecuador",
      egypt: "Egypt",
      el_salvador: "El Salvador",
      equatorial_guinea: "Equatorial Guinea",
      eritrea: "Eritrea",
      estonia: "Estonia",
      eswatini: "Eswatini",
      ethiopia: "Ethiopia",
      fiji: "Fiji",
      finland: "Finland",
      france: "France",
      gabon: "Gabon",
      gambia: "Gambia",
      georgia: "Georgia",
      germany: "Germany",
      ghana: "Ghana",
      greece: "Greece",
      grenada: "Grenada",
      guatemala: "Guatemala",
      guinea: "Guinea",
      guinea_bissau: "Guinea-Bissau",
      guyana: "Guyana",
      haiti: "Haiti",
      holy_see: "Holy See",
      honduras: "Honduras",
      hungary: "Hungary",
      iceland: "Iceland",
      india: "India",
      indonesia: "Indonesia",
      iran: "Iran",
      iraq: "Iraq",
      ireland: "Ireland",
      israel: "Israel",
      italy: "Italy",
      jamaica: "Jamaica",
      japan: "Japan",
      jordan: "Jordan",
      kazakhstan: "Kazakhstan",
      kenya: "Kenya",
      kiribati: "Kiribati",
      kuwait: "Kuwait",
      kyrgyzstan: "Kyrgyzstan",
      laos: "Laos",
      latvia: "Latvia",
      lebanon: "Lebanon",
      lesotho: "Lesotho",
      liberia: "Liberia",
      libya: "Libya",
      liechtenstein: "Liechtenstein",
      lithuania: "Lithuania",
      luxembourg: "Luxembourg",
      madagascar: "Madagascar",
      malawi: "Malawi",
      malaysia: "Malaysia",
      maldives: "Maldives",
      mali: "Mali",
      malta: "Malta",
      marshall_islands: "Marshall Islands",
      mauritania: "Mauritania",
      mauritius: "Mauritius",
      mexico: "Mexico",
      micronesia: "Micronesia",
      moldova: "Moldova",
      monaco: "Monaco",
      mongolia: "Mongolia",
      montenegro: "Montenegro",
      morocco: "Morocco",
      mozambique: "Mozambique",
      myanmar: "Myanmar",
      namibia: "Namibia",
      nauru: "Nauru",
      nepal: "Nepal",
      netherlands: "Netherlands",
      new_zealand: "New Zealand",
      nicaragua: "Nicaragua",
      niger: "Niger",
      nigeria: "Nigeria",
      north_korea: "North Korea",
      north_macedonia: "North Macedonia",
      norway: "Norway",
      oman: "Oman",
      pakistan: "Pakistan",
      palau: "Palau",
      palestine: "Palestine",
      panama: "Panama",
      papua_new_guinea: "Papua New Guinea",
      paraguay: "Paraguay",
      peru: "Peru",
      philippines: "Philippines",
      poland: "Poland",
      portugal: "Portugal",
      qatar: "Qatar",
      romania: "Romania",
      russia: "Russia",
      rwanda: "Rwanda",
      saint_kitts_and_nevis: "Saint Kitts and Nevis",
      saint_lucia: "Saint Lucia",
      sint_vincent_and_the_grenadines: "Saint Vincent and the Grenadines",
      samoa: "Samoa",
      san_marino: "San Marino",
      sao_tome_and_principe: "Sao Tome and Principe",
      saudi_arabia: "Saudi Arabia",
      senegal: "Senegal",
      serbia: "Serbia",
      seychelles: "Seychelles",
      sierra_leone: "Sierra Leone",
      singapore: "Singapore",
      slovakia: "Slovakia",
      slovenia: "Slovenia",
      solomon_islands: "Solomon Islands",
      somalia: "Somalia",
      south_africa: "South Africa",
      south_korea: "South Korea",
      south_sudan: "South Sudan",
      spain: "Spain",
      sri_lanka: "Sri Lanka",
      sudan: "Sudan",
      suriname: "Suriname",
      sweden: "Sweden",
      switzerland: "Switzerland",
      syria: "Syria",
      tajikistan: "Tajikistan",
      tanzania: "Tanzania",
      thailand: "Thailand",
      timor_leste: "Timor-Leste",
      togo: "Togo",
      tonga: "Tonga",
      trinidad_and_tobago: "Trinidad and Tobago",
      tunisia: "Tunisia",
      turkey: "Turkey",
      turkmenistan: "Turkmenistan",
      tuvalu: "Tuvalu",
      uganda: "Uganda",
      ukraine: "Ukraine",
      united_arab_Emirates: "United Arab Emirates",
      united_kingdom: "United Kingdom",
      united_states_of_america: "United States of America",
      uruguay: "Uruguay",
      uzbekistan: "Uzbekistan",
      vanuatu: "Vanuatu",
      venezuela: "Venezuela",
      vietnam: "Vietnam",
      yemen: "Yemen",
      zambia: "Zambia",
      zimbabwe: "Zimbabwe"
    }
  end
end
