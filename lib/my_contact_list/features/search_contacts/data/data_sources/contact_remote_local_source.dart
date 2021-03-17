import 'package:my_contact_list/my_contact_list/core/notification/success.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/entities/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:meta/meta.dart';

abstract class ContactLocalDataSource{
  //contracts for getting contacts
  Future<List<Contact>> getAllContacts();
  Future<List<Contact>> getContactsByName(String name );
  Future<List<Contact>> getContactsBySurname(String surname);
  Future<List<Contact>> getContactsByCellNumber(String cellNumber);
  //contracts for other operations
  Future<CreateSuccess> createContact(Contact contact);
  Future<UpdateSuccess> updateContact(Contact contact);
  Future<DeleteSuccess> deleteContact(String cellNumber);
}

class  ContactLocalDataSourceImpl implements ContactLocalDataSource{
  final Database database;


  ContactLocalDataSourceImpl({@required this.database});

  @override
  Future<CreateSuccess> createContact(Contact contact) {
    // TODO: implement createContact
    throw UnimplementedError();
  }

  @override
  Future<DeleteSuccess> deleteContact(String cellNumber) {
    // TODO: implement deleteContact
    throw UnimplementedError();
  }

  @override
  Future<List<Contact>> getAllContacts() {
    // TODO: implement getAllContacts
    throw UnimplementedError();
  }

  @override
  Future<List<Contact>> getContactsByCellNumber(String cellNumber) {
    // TODO: implement getContactsByCellNumber
    throw UnimplementedError();
  }

  @override
  Future<List<Contact>> getContactsByName(String name) {
    // TODO: implement getContactsByName
    throw UnimplementedError();
  }

  @override
  Future<List<Contact>> getContactsBySurname(String surname) {
    // TODO: implement getContactsBySurname
    throw UnimplementedError();
  }

  @override
  Future<UpdateSuccess> updateContact(Contact contact) {
    // TODO: implement updateContact
    throw UnimplementedError();
  }

}