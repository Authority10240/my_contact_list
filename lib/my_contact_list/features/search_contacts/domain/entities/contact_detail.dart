import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ContactDetail extends Equatable{

  final String contactDetailId;
  final String contactId;
  final String description;
  //contact type can be a address, cell number, email or telephone number
  final String contactTypeId;

  ContactDetail(
      @required this.contactDetailId,
      @required this.contactId,
      @required this.description,
      @required this.contactTypeId)
      : super([contactDetailId,contactId,description,contactTypeId]);
}