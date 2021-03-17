import 'package:dartz/dartz.dart';
import 'package:my_contact_list/my_contact_list/core/error/failure.dart';
import 'package:my_contact_list/my_contact_list/core/notification/success.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/entities/contact.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/repositories/contact_repository.dart';

class UpdateContact{
  ContactRepository repository;

  UpdateContact(this.repository);

  Future<Either<Failure,Success>> call(Contact contact) async{
    return await repository.updateContact(contact);
  }
}