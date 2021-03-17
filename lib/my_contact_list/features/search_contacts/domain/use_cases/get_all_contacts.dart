import 'package:dartz/dartz.dart';
import 'package:my_contact_list/my_contact_list/core/error/failure.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/entities/contact.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/repositories/contact_repository.dart';

class GetAllContacts {
  final ContactRepository repository;

  GetAllContacts(this.repository);

 Future<Either<Failure,List<Contact>>> call() async {
    return await repository.getAllContacts();
 }
}