
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_contact_list/my_contact_list/core/error/failure.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/entities/contact.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/repositories/contact_repository.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/use_cases/get_contacts_by_surname.dart';

import 'get_contacts_by_cell_number_test.dart';

class MockContactRepository extends Mock implements ContactRepository{}

  void main(){
    GetContactBySurname getContactBySurname;
    MockContactRepository mockContactRepository;

    const contactSurname = "Mathebula";

    setUp((){
      mockContactRepository = MockContactRepository();
      getContactBySurname = GetContactBySurname(repository: mockContactRepository);
    });

    group('getContactBySurname',(){

      test('should return contact when surname is passed from repository when searching by surname',() async{
        //arrange
        when(mockContactRepository.getContactsBySurname(contactSurname))
            .thenAnswer((_) async => Right(tContact));
        //act
        final result  = await getContactBySurname(contactSurname);
        //assert
        expect(result, Right(tContact));
      });


    });
  }
