import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:my_contact_list/my_contact_list/core/notification/success.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/entities/contact.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/repositories/contact_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/use_cases/create_contact.dart';

import 'get_contacts_by_cell_number_test.dart';


class MockContactRepository extends Mock implements ContactRepository{}

void main(){

  CreateContact createContact;
  MockContactRepository mockContactRepository;
  Contact contact;

  setUp(() {
    mockContactRepository = MockContactRepository();
    createContact = CreateContact(mockContactRepository);
  });

  group('createContact',(){

    test('should return a create success when contact is created', () async{
      //arrange
      when(mockContactRepository.createContact(tContact[0]))
          .thenAnswer((_) async => Right(CreateSuccess()));
      //act
      final result = await createContact(tContact[0]);
      //assert
      expect(result, Right(CreateSuccess()));
    });
  });
}