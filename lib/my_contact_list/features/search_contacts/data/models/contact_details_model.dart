import 'package:meta/meta.dart';

class ContactDetailsModel{
  final String contactDetailId;
  final String contactId;
  final String description;
  //contact type can be a address, cell number, email or telephone number
  final String contactTypeId;

  ContactDetailsModel({this.contactDetailId,
    this.contactId,
    this.description,
    this.contactTypeId}
      )
  : super();


  factory ContactDetailsModel.fromJson(Map<String, dynamic> map){
    return ContactDetailsModel(
        contactDetailId : map['contactDetailId'],
        contactId: map['contactId'],
        description: map['description'],
        contactTypeId: map['contactTypeId']);
  }

  Map<String , dynamic> toJson(){
    return{
      'contactDetailId': contactDetailId,
      'contactId': contactId,
      'description' : description,
      'contactTypeId' : contactTypeId
    };
  }

}