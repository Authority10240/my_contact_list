import 'package:dartz/dartz.dart';
import 'package:my_contact_list/my_contact_list/core/error/failure.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/entities/contact.dart';
import '';
import 'package:my_contact_list/my_contact_list/core/notification/success.dart';

abstract class ContactRepository{
  //contracts for getting contacts
  Future<Either<Failure,List<Contact>>> getAllContacts();
  Future<Either<Failure,List<Contact>>> getContactsByName(String name);
  Future<Either<Failure,List<Contact>>> getContactsBySurname(String surname);
  Future<Either<Failure,List<Contact>>> getContactsByCellNumber(String cellNumber);
  //contracts for other operations
  Future<Either<Failure,CreateSuccess>> createContact(Contact contact);
  Future<Either<Failure,UpdateSuccess>> updateContact(Contact contact);
  Future<Either<Failure,DeleteSuccess>> deleteContact(String cellNumber);
}