import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Contact extends Equatable{
  final String contactID;
  final String firstName;
  final String surname;
  final String birthDate;
  final String updatedDate;

  Contact({
    @required this.contactID,
    @required this.firstName,
    @required this.surname,
    @required this.birthDate,
    @required this.updatedDate})
      : super([contactID,firstName,surname,birthDate,updatedDate]);
}