import 'package:tut_app/application_layer/constants.dart';
import 'package:tut_app/application_layer/extensions.dart';
import 'package:tut_app/data_layer/response/responses.dart';
import 'package:tut_app/domain_layer/data_classes/data_classes.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id.orEmpty() ?? Constants.emptyText,
        this?.name.orEmpty() ?? Constants.emptyText,
        this?.numberOfNotifications.orZero() ?? Constants.zero);
  }
}
extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
        this?.phone.orEmpty() ?? Constants.emptyText,
        this?.email.orEmpty() ?? Constants.emptyText,
        this?.link.orEmpty() ?? Constants.emptyText);
  }
}
extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.customer, this?.contacts);
  }
}