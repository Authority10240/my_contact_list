import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/data/data_sources/contact_remote_local_source.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/repositories/contact_repository.dart';
import 'package:sqflite/sqflite.dart';

class MockDatabase extends Mock implements Database{

  void main(){
    ContactLocalDataSourceImpl contactLocalDataSourceImpl;
    MockDatabase mockDatabase;

    setUp((){
      mockDatabase = MockDatabase();
      contactLocalDataSourceImpl =
          ContactLocalDataSourceImpl(database: mockDatabase);
    });


  }
}