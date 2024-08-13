enum LanguageType{
  english,
  arabic ,
}

const String arabicValue = "ar";
const String englishValue = "en";
extension LanguageTypeExtension on LanguageType{
  String getValue(){
    switch(this){
      case LanguageType.english:
        return englishValue;
      case LanguageType.arabic:
        return arabicValue;
      default:
        return englishValue;
    }
  }
}