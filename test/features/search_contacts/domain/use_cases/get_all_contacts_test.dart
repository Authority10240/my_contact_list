import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:my_contact_list/my_contact_list/core/error/failure.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/repositories/contact_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/use_cases/get_all_contacts.dart';

import 'get_contacts_by_cell_number_test.dart';

class MockContactRepository extends Mock
implements ContactRepository{}

void main(){
  GetAllContacts allContacts;
  MockContactRepository mockContactRepository;

  setUp((){
    mockContactRepository = MockContactRepository();
    allContacts = GetAllContacts(mockContactRepository);
  });


  group('getallContacts',(){
  test('should get all contacts from the repository', ()async{
    //arrange
    when(mockContactRepository.getAllContacts())
        .thenAnswer((_) async => Right(tContact));
    //act
    final result = await allContacts();
    //assert
    expect(result, Right(tContact));

  });

  test('should return an error if no contacts are found',() async{
    //arrange
    when(mockContactRepository.getAllContacts())
        .thenAnswer((_) async => Left(EmptyListFailure()));
    //act
    final result = await allContacts();
    //assert
    expect(result, Left(EmptyListFailure()));
  });
  });
}