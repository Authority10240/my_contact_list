import 'package:dartz/dartz.dart';
import 'package:my_contact_list/my_contact_list/core/error/failure.dart';
import 'package:my_contact_list/my_contact_list/core/notification/success.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/data/sql_database/sql_database.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/entities/contact.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/repositories/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository{
  final SqlDatabase sqlDatabase;

  ContactRepositoryImpl(this.sqlDatabase);

  @override
  Future<Either<Failure, CreateSuccess>> createContact(Contact contact) async {
    try {
      int result = await sqlDatabase.createContact(contact);
      if (result == 1) {
        return Right(CreateSuccess());
      } else {
        return Left(CreateFailure());
      }
    } catch (ex) {
      return Left(CreateFailure());
    }
  }

  @override
  Future<Either<Failure, DeleteSuccess>> deleteContact(String cellNumber) async {
    try{
      int result = await sqlDatabase.deleteContact(cellNumber);
      if(result == 1){
        return Right(DeleteSuccess());
      }else{
        return Left(DeleteFailure());
      }
    }catch(ex){
      return Left(DeleteFailure());
    }
  }

  @override
  Future<Either<Failure, List<Contact>>> getAllContacts() async {
    try {
      final result = await sqlDatabase.getAllContacts();
      return  Right(result);
    }catch(ex){
      return Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, List<Contact>>> getContactsByCellNumber(String cellNumber) async {
    try {
      final result = await sqlDatabase.filterGetQuery(0, cellNumber);
      return  Right(result);
    }catch(ex){
      return Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, List<Contact>>> getContactsByName(String name) async {
    // TODO: implement getContactsByName
    try {
      final result = await sqlDatabase.filterGetQuery(0, name);
      return  Right(result);
    }catch(ex){
      return Left(QueryFailure());
    }

  }

  @override
  Future<Either<Failure, List<Contact>>> getContactsBySurname(String surname) async {
    try {
      final result = await sqlDatabase.filterGetQuery(1, surname);
      return  Right(result);
    }catch(ex){
      return Left(QueryFailure());
    }
  }

  @override
  Future<Either<Failure, UpdateSuccess>> updateContact(Contact contact) async {
    try{
      int result = await sqlDatabase.updateContact(contact);

      if(result == 1){
        return Right(UpdateSuccess());
      }else{
        return Left(UpdateFailure());
      }

    }catch(ex){
      return Left(UpdateFailure());
    }
  }
  
}