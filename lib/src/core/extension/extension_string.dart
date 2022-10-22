extension MemberStringParse on String {
  String toUpperCasePartial() {
    var result = this;
    if (result.isEmpty) {
      return '';
    }
    var aux2 = result.toLowerCase();
    return aux2[0].toUpperCase() + aux2.substring(1);
  }

  int get toIntParse {
    try{
      var result = this;
      var parser = int.tryParse(result) ?? 0;
      return parser;
    }catch(_){
      return 0;
    }
  }
}
