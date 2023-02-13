class Country {
  const Country(this.name, this.domain);

  final String name;
  final String domain;
}

const Country uae = Country('Unated Arab Emirates', 'ae');
const Country switzerland = Country('Switzerland', 'ch');
const Country usa = Country('USA', 'us');
const Country russia = Country('Russia', 'ru');
const Country korea = Country('Korea', 'kr');
const Country japan = Country('Japan', 'jp');
const Country china = Country('China', 'cn');

const Set<Country> countriesSet = {
  china,
  japan,
  korea,
  russia,
  switzerland,
  uae,
  usa,
};

const List<Country> countriesList = [
  china,
  japan,
  korea,
  russia,
  switzerland,
  uae,
  usa,
];
