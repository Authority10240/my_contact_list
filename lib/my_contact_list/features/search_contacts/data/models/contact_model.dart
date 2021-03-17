

import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/entities/contact.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
class ContactModel extends Contact{
  final String contactID;
  final String firstName;
  final String surname;
  final String birthDate;
  final String updatedDate;

  ContactModel({
    @required this.contactID,
    @required this.firstName,
    @required this.surname,
    @required this.birthDate,
    @required this.updatedDate})
  : super(contactID: contactID , firstName:  firstName , surname: surname
      , birthDate: birthDate , updatedDate: updatedDate);

  factory ContactModel.fromJson(Map<String, dynamic> map){
    return ContactModel(
        contactID: map['contactID'],
        firstName: map['firstName'],
        surname: map['surname'] ,
        birthDate: map['birthDate'] ,
        updatedDate: map['updateDate'] );
  }

  Map<String , dynamic> toJson(){
    return{
      'contactID': contactID,
      'firstName': firstName,
      'surname' : surname,
      'birthDate' : birthDate,
      'updatedDate' : updatedDate
    };
  }


}