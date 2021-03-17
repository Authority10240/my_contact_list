import 'package:flutter_test/flutter_test.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/data/models/contact_model.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/entities/contact.dart';

import '../../domain/use_cases/get_contacts_by_cell_number_test.dart';

void main(){
  final testContactModel = ContactModel(
      contactID: '0810434369',
  firstName: 'Freedom',
  surname: 'Mathebula',
  birthDate: '25/12/1996',
  updatedDate: '15/03/2021');

  test('should be a subclass of Contact entity', (){
    //assert
    expect(testContactModel,isA<Contact>());
  });
}