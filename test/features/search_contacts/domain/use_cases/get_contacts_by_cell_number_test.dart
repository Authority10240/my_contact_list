import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/entities/contact.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/repositories/contact_repository.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/use_cases/get_contacts_by_cell_number.dart';

final tContact = [Contact(
contactID: "9612255998083",
firstName: "Freedom",
surname: "Mathebula",
birthDate: "25/12/1996",
updatedDate: "15/03/2021")];

class MockContactRepository extends Mock implements ContactRepository{
}

void main(){

  GetContactsByCellNumber getContactByCellNumber;
  MockContactRepository mockContactRepository;


  setUp((){
    mockContactRepository = MockContactRepository();
    getContactByCellNumber = GetContactsByCellNumber(mockContactRepository);
  });



  group('getContactsByCellNumber', (){
    String cellNumber = '0810434369';

    test('should get contacts from repository using a cell number',() async{
      //arrange
      when(mockContactRepository.getContactsByCellNumber(cellNumber))
          .thenAnswer((_) async =>  Right(tContact));
      //act

      final result = await getContactByCellNumber(cellNumber);
      //assert
      expect(result,Right(tContact));
    });
  });
}