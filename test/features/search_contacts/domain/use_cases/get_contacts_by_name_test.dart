

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_contact_list/my_contact_list/core/error/failure.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/entities/contact.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/repositories/contact_repository.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/use_cases/get_contacts_by_name.dart';

import 'get_contacts_by_cell_number_test.dart';

class MockContactRepository extends Mock
implements ContactRepository{}

void main(){
    GetContactsByName getContactByName;
    MockContactRepository mockContactRepository;

    const contactName = "Freedom";

    setUp((){
      mockContactRepository = MockContactRepository();
      getContactByName = GetContactsByName(mockContactRepository);
    });

    group('getContactByName',(){

      test('should return contact when name is passed from repository when searching by name',() async{
        //arrange
        when(mockContactRepository.getContactsByName(contactName))
        .thenAnswer((_) async => Right(tContact));
        //act
        final result  = await getContactByName(contactName);
        //assert
        expect(result, Right(tContact));
      });
    });
  }
