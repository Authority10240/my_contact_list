import 'package:my_contact_list/my_contact_list/core/error/failure.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/entities/contact.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/repositories/contact_repository.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
class GetContactBySurname{
  ContactRepository repository;

  GetContactBySurname({@required this.repository});

  Future<Either<Failure,List<Contact>>> call (String surname) async{
    return await repository.getContactsBySurname(surname);
  }
}