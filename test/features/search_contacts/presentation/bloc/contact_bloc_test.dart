import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:my_contact_list/my_contact_list/core/util/input_converter.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/entities/contact.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/presentation/contact_bloc.dart';

import '../../domain/use_cases/get_contacts_by_cell_number_test.dart';


class MockGetAllContacts extends Mock implements GetAllContacts{}

class MockGetContactBySurname extends Mock implements GetContactBySurname{}

class MockGetContactByName extends Mock implements GetContactByName{}

class MockGetContactByCell extends Mock implements GetContactByCell{}

class MockInputConverter extends Mock implements InputConverter{}

void main () {
   ContactBloc bloc;
   MockGetAllContacts mockGetAllContacts;
   MockGetContactByCell mockGetContactByCell;
   MockGetContactByName mockGetContactByName;
   MockGetContactBySurname mockGetContactBySurname;
   MockInputConverter mockInputConverter;
   setUp((){
     mockGetContactBySurname = MockGetContactBySurname();
     mockGetContactByName = MockGetContactByName();
     mockGetContactByCell = MockGetContactByCell();
     mockInputConverter = MockInputConverter();
     mockGetAllContacts = MockGetAllContacts();

     bloc = ContactBloc(
         getAllContact: mockGetAllContacts,
         getContactByCell: mockGetContactByCell,
         getContactByName: mockGetContactByName,
         getContactBySurname: mockGetContactBySurname,
         inputConverter: mockInputConverter);
   });

   test('initialState should be empty',(){
     //assert
     expect(bloc.initialState, equals(Empty()));
   });

  group('GetContactByName',(){
    final tName = 'Freedom';
    final List<Contact> mContact = tContact;


  });
}