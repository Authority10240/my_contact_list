import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_contact_list/my_contact_list/core/error/failure.dart';
import 'package:my_contact_list/my_contact_list/core/notification/success.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/data/data_sources/contact_remote_local_source.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/data/repositories/contact_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/data/sql_database/sql_database.dart';
import '../../domain/use_cases/get_contacts_by_cell_number_test.dart';

class MockSQLDatabase extends Mock
    implements SqlDatabase{
}

void main(){
  ContactRepositoryImpl repository;
  MockSQLDatabase mockSQLDatabase;
  setUp((){
    mockSQLDatabase = MockSQLDatabase();
    repository = ContactRepositoryImpl(mockSQLDatabase);
  });

  String name = 'Freedom';
  String surname = 'Mathebula';
  String cellNumber = '0810434369';

  group('getContactByName',(){
    test('should return all contacts from database through repository based on name',() async{
      when(await repository.getContactsByName(name))
      .thenAnswer((_) =>   Right(tContact));

      final result = await repository.getContactsByName(name);

      expect(result,Right(tContact));
    });

    test('should return Queryfailure if there are no values in the repository',()async{
      when(await repository.getContactsByName(name) )
          .thenAnswer((_) => Left(QueryFailure()));

      final result = await repository.getContactsByName(name);

      expect(result,Left(QueryFailure()));
    });

  });

  group('getContactBySurname',(){
    test('should return all contacts from database through repository based on surname',() async{
      when(await repository.getContactsBySurname(surname))
          .thenAnswer((_) =>   Right(tContact));

      final result = await repository.getContactsBySurname(surname);

      expect(result,Right(tContact));
    });

    test('should return Queryfailure if there are no values in the repository',()async{
      when(await repository.getContactsBySurname(name) )
          .thenAnswer((_) => Left(QueryFailure()));

      final result = await repository.getContactsBySurname(name);

      expect(result,Left(QueryFailure()));
    });

  });

  group('getContactByCellNumber',(){
    test('should return all contacts from database through repository based on cell number',() async{
      when(await repository.getContactsByCellNumber(name))
          .thenAnswer((_) =>   Right(tContact));

      final result = await repository.getContactsByCellNumber(name);

      expect(result,Right(tContact));
    });

    test('should return Queryfailure if there are no values in the repository',()async{
      when(await repository.getContactsByCellNumber(name) )
          .thenAnswer((_) => Left(QueryFailure()));

      final result = await repository.getContactsByCellNumber(name);

      expect(result,Left(QueryFailure()));
    });

  });

  group('createContact',(){

    test('should return success when new contact inserted',() async{
      when(await repository.createContact(tContact[0]))
          .thenAnswer((_) => Right(CreateSuccess()));

      final result = await repository.createContact(tContact[0]);

      expect(result, Right(CreateSuccess()));
    });

    test('Should return CreateFailure when duplicate record inserted',()async{
      when(await repository.createContact(tContact[0])).
      thenAnswer((_) => Left(CreateFailure()));

      final firstResult = await repository.createContact(tContact[0]);
      final secondResult = await repository.createContact(tContact[0]);

      expect(secondResult, equals(Left(CreateFailure())));
    });

  });

  group('deleteContact',(){

    test('should return success when new contact deleted',() async{
      when(await repository.deleteContact(cellNumber))
          .thenAnswer((_) => Right(DeleteSuccess()));

      final result = await repository.deleteContact(cellNumber);

      expect(result, Right(DeleteSuccess()));
    });

    test('Should return CreateFailure when duplicate record inserted',()async{
      when(await repository.deleteContact(cellNumber)).
      thenAnswer((_) => Left(DeleteFailure()));

      final firstResult = await repository.deleteContact(cellNumber);
      final secondResult = await repository.deleteContact(cellNumber);

      expect(secondResult, equals(Left(DeleteFailure())));
    });
  });

  group('updateContact',(){

    test('should return success when existing contact is updated',() async{
      when(await repository.updateContact(tContact[0]))
          .thenAnswer((_) => Right(UpdateSuccess()));

      final result = await repository.updateContact(tContact[0]);

      expect(result, Right(UpdateSuccess()));
    });

    test('Should return updateFailure when a record fails to update',()async{
      when(await repository.updateContact(tContact[0])).
      thenAnswer((_) => Left(UpdateFailure()));

      final firstResult = await repository.updateContact(tContact[0]);


      expect(firstResult, equals(Left(UpdateFailure())));
    });

  });


}