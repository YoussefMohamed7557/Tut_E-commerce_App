import 'package:tut_app/data_layer/response/responses.dart';

class SliderObject {
  String title;
  String subTitle;
  String imagePath;
  SliderObject(this.title, this.subTitle, this.imagePath);
}
class SliderViewObject {
  SliderObject sliderObject;
  int numberOfSlides;
  int currentIndex;
  SliderViewObject({required this.sliderObject,required this.numberOfSlides,required this.currentIndex});
}

// login data classes
class Customer{
  String id;
  String name;
  int numberOfNotifications;
  Customer(this.id, this.name, this.numberOfNotifications);
}
class Contacts{
  String phone;
  String email;
  String link;
  Contacts(this.phone, this.email, this.link);
}
class Authentication{
  CustomerResponse? customer;
  ContactsResponse? contacts;
  Authentication(this.customer, this.contacts);
}