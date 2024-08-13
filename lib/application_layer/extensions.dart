import 'package:tut_app/application_layer/constants.dart';

extension NotNullString on String?{
  // this method insures that this string is not null value
  String orEmpty(){
    if(this == null){
      return Constants.emptyText;
    }else{
      return this!;
    }
  }
}
extension NotNullInteger on int?{
  // this method insures that this int value is not null value
  int orZero(){
    if(this == null){
      return Constants.zero;
    }else{
      return this!;
    }
  }
}