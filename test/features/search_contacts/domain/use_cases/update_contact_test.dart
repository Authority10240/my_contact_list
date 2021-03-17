import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_contact_list/my_contact_list/core/notification/success.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/repositories/contact_repository.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/use_cases/delete_contact.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/use_cases/update_contact.dart';

import 'get_contacts_by_cell_number_test.dart';

class MockContactRepository extends Mock implements ContactRepository{}

void main() {
  MockContactRepository mockContactRepository;
  UpdateContact updateContact;

  setUp(() {
    mockContactRepository = MockContactRepository();
    updateContact = UpdateContact(mockContactRepository);
  });

  group('deleteContact', () {
    test(
        'should return success when get repository method deleteContact', () async {
      //arrange
      when(mockContactRepository.updateContact(tContact[0]))
          .thenAnswer((_) async => Right(UpdateSuccess()));
      //act
      final result = await updateContact(tContact[0]);
      //assert
      expect(result, Right(UpdateSuccess()));
    });
  });
}