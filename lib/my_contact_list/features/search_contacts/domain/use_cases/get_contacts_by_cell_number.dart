import 'package:my_contact_list/my_contact_list/core/error/failure.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/entities/contact.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/repositories/contact_repository.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

class GetContactsByCellNumber{

  final ContactRepository repository;

  GetContactsByCellNumber(this.repository);

  Future<Either<Failure,List<Contact>>> call(String number) async{
    return await repository.getContactsByCellNumber(number);
  }
}