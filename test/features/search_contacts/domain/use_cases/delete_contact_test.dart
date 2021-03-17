import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:my_contact_list/my_contact_list/core/notification/success.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/entities/contact.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/repositories/contact_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/use_cases/create_contact.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/use_cases/delete_contact.dart';

import 'get_contacts_by_cell_number_test.dart';

class MockContactRepository extends Mock implements ContactRepository{}

void main(){

  MockContactRepository mockContactRepository;
  DeleteContact deleteContact;

  setUp((){
    mockContactRepository = MockContactRepository();
    deleteContact = DeleteContact(mockContactRepository);
  });

  group('deleteContact',() {
    test('should return success when deleteContact is called from repository',() async{
      //arrange
      when(mockContactRepository.deleteContact(tContact[0].contactID))
          .thenAnswer((_)  async => Right(DeleteSuccess()));
      //act

      final result = await deleteContact(tContact[0].contactID);
      //assert
      expect(result, Right(DeleteSuccess()));
    });
  });
}