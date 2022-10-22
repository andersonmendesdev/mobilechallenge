// ignore_for_file: constant_identifier_names

enum TypeFilterEnum { nat, gender, all, none }

enum FilterGenderEnum {none, male, female }

enum FilterNatEnum {
  none,
  AU,
  BR,
  CA,
  CH,
  DE,
  DK,
  ES,
  FI,
  FR,
  GB,
  IE,
  IN,
  IR,
  MX,
  NL,
  NO,
  NZ,
  RS,
  TR,
  UA,
  US,

}

extension MemberFilterGender on FilterGenderEnum {
  String toValueString() {
    var filter = this;
    switch (filter) {
      case FilterGenderEnum.male:
        return 'male';
      case FilterGenderEnum.female:
        return 'female';
      case FilterGenderEnum.none:
        return '';
    }
  }
  String toValueView() {
    var filter = this;
    switch (filter) {
      case FilterGenderEnum.male:
        return 'Male';
      case FilterGenderEnum.female:
        return 'Female';
      case FilterGenderEnum.none:
        return 'None';
    }
  }
}

extension MemberFilterNat on FilterNatEnum {
  String toValueView() {
    var filter = this;
    switch (filter) {
      case FilterNatEnum.AU:
        return 'Australia';
      case FilterNatEnum.BR:
        return 'Brazil';
      case FilterNatEnum.CA:
        return 'Canada';
      case FilterNatEnum.CH:
        return 'Switzerland';
      case FilterNatEnum.DE:
        return 'Germany';
      case FilterNatEnum.DK:
        return 'Denmark';
      case FilterNatEnum.ES:
        return 'Spain';
      case FilterNatEnum.FI:
        return 'Finland';
      case FilterNatEnum.FR:
        return 'France';
      case FilterNatEnum.GB:
        return 'United Kingdom';
      case FilterNatEnum.IE:
        return 'Ireland';
      case FilterNatEnum.IN:
        return 'India';
      case FilterNatEnum.IR:
        return 'Iran';
      case FilterNatEnum.MX:
        return 'Mexico';
      case FilterNatEnum.NL:
        return 'Netherlands';
      case FilterNatEnum.NO:
        return 'Norway';
      case FilterNatEnum.NZ:
        return 'New Zealand';
      case FilterNatEnum.RS:
        return 'Serbia';
      case FilterNatEnum.TR:
        return 'Turkey';
      case FilterNatEnum.UA:
        return 'Ukraine';
      case FilterNatEnum.US:
        return 'United States';
      case FilterNatEnum.none:
        return 'None';
    }
  }

  String toValueQuery(){
    var filter = this;
    switch (filter) {
      case FilterNatEnum.AU:
        return 'AU';
      case FilterNatEnum.BR:
        return 'BR';
      case FilterNatEnum.CA:
        return 'CA';
      case FilterNatEnum.CH:
        return 'CH';
      case FilterNatEnum.DE:
        return 'DE';
      case FilterNatEnum.DK:
        return 'DK';
      case FilterNatEnum.ES:
        return 'ES';
      case FilterNatEnum.FI:
        return 'FI';
      case FilterNatEnum.FR:
        return 'FR';
      case FilterNatEnum.GB:
        return 'GB';
      case FilterNatEnum.IE:
        return 'IE';
      case FilterNatEnum.IN:
        return 'IN';
      case FilterNatEnum.IR:
        return 'IR';
      case FilterNatEnum.MX:
        return 'MX';
      case FilterNatEnum.NL:
        return 'NL';
      case FilterNatEnum.NO:
        return 'NO';
      case FilterNatEnum.NZ:
        return 'NZ';
      case FilterNatEnum.RS:
        return 'RS';
      case FilterNatEnum.TR:
        return 'TR';
      case FilterNatEnum.UA:
        return 'UA';
      case FilterNatEnum.US:
        return 'US';
      case FilterNatEnum.none:
        return '';
    }
  }
}
