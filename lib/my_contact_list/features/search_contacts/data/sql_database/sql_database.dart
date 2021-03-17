import 'package:my_contact_list/my_contact_list/core/error/exceptions.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/data/data_sources/contact_remote_local_source.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/data/models/contact_model.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/entities/contact.dart';
import 'package:sqflite/sqflite.dart';
import  'package:path/path.dart';

class SqlDatabase {

  //*Table columns for the Contact table
  //  contact table - name of the table
  static const String CONTACT_TABLE_NAME = 'CONTACT_TABLE';
  // table columns
  static const String CONTACT_ID = 'CONTACT_ID'; // column is also in contact details table
  static const String FIRST_NAME = 'FIRST_NAME';
  static const String SURNAME = 'SURNAME';
  static const String BIRTH_DATE = 'BIRTH_DATE';
  static const String UPDATED_DATE = 'UPDATED_DATE';

  //contact detail table- name of the table
  static const String CONTACT_DETAIL_TABLE_NAME = 'CONTAXT_DETAIL_TABLE_NAME';
  //table columns
  static const String CONTACT_DETAIL_ID ='CONTACT_DETAIL_ID';
  //table must include contct id
  static const String DESCRIPTION = 'DESCRIPTION';
  static const String CONTACT_TYPE_ID = 'CONTACT_TYPE_ID';

  //statements for database elements creation
  // contact table create statement
  static const String CREATE_CONTACT_TABLE =
  'CREATE TABLE $CONTACT_DETAIL_TABLE_NAME ( '
      '$CONTACT_ID  TEXT PRIMARY KEY , '
      '$FIRST_NAME TEXT , '
      '$SURNAME TEXT '
      '$BIRTH_DATE TEXT , '
      '$UPDATED_DATE TEXT )';

  static const String CREATE_CONTACT_DETAIL_TABLE =
  'CREATE TABLE $CONTACT_DETAIL_TABLE_NAME ( '
      '$CONTACT_DETAIL_ID INTEGER PRIMARY KEY AUTOINCREMENT  , '
      '$DESCRIPTION TEXT , '
      '$CONTACT_TYPE_ID TEXT)';


  SqlDatabase._();

  static final SqlDatabase db = SqlDatabase._();

  Database _database;
  

  Future<Database> get database async{
    if(_database != null){
      return _database;
    }else{

      _database = await createDatabase();

      return _database;
    }

  }

  Future<Database> createDatabase() async{
    String path = join(await getDatabasesPath(),'Contact.db');

    return await openDatabase(path,
    version: 1,
    onCreate: (Database database , int version) async{
      //create contact table
      
      await database.execute(CREATE_CONTACT_TABLE);
      await database.execute(CREATE_CONTACT_DETAIL_TABLE);
    });
  }

  Future<int> createContact(Contact contact) async{
    try {
      final dbAccess = await database;

      return dbAccess.insert(CONTACT_TABLE_NAME, ContactModel(
          contactID: contact.contactID,
          firstName: contact.firstName,
          surname: contact.surname,
          birthDate: contact.birthDate,
          updatedDate: contact.updatedDate).toJson());


    }catch(Ex){
      throw CreateException();
    }
  }

  Future<int> updateContact(Contact contact) async{
    try{
      final dbAccess = await database;

      return dbAccess.update(CONTACT_TABLE_NAME,  ContactModel(
          contactID: contact.contactID,
          firstName: contact.firstName,
          surname: contact.surname,
          birthDate: contact.birthDate,
          updatedDate: contact.updatedDate).toJson());
    }catch (ex){
      throw UpdateException();
    }
  }

  Future<int> deleteContact(String contactId) async{
    try {
      final dbaccess = await database;

      return dbaccess.delete(
          CONTACT_TABLE_NAME,
          where: '$CONTACT_ID = ?',
          whereArgs: [contactId]);
    }catch(ex){
      throw DeleteException();
    }
  }

  Future<List<Contact>> getAllContacts() async {
    try {
      final dbAccess = await database;
      List<Contact> retrievedContacts = [];
      List<Map<String, dynamic>> contacts = await dbAccess.query(
          CONTACT_TABLE_NAME);

      for (int i = 0; i < contacts.length; i++) {
        retrievedContacts.add(ContactModel.fromJson(contacts[i]));
      }
    }
    catch(ex){
      throw QueryException();
    }
  }
  ///*will determine which criteria was used to call the query .
  ///will retrun the results of that query to the call.
  ///
  Future<List<Contact>>filterGetQuery(int type , String description){
    switch(type){
      // for filtering by name
      case 0 : return getContactsByFilter(description, FIRST_NAME);
      break;
      //for filtering by surname
      case 1 : return getContactsByFilter(description, SURNAME);
      break ;
      // for filtering by cell number
      case 2 : return getContactsByFilter(description, CONTACT_ID);
    }
  }
  ///* works hand in hand with the above function to return the correct query result.
  ///
  Future<List<Contact>> getContactsByFilter(String description, String where) async {
    try {
      final dbAccess = await database;
      List<Contact> retrievedContacts = [];
      List<Map<String, dynamic>> contacts = await dbAccess.query(
          CONTACT_TABLE_NAME, where: '$where = ?' , whereArgs: [description]);

      for (int i = 0; i < contacts.length; i++) {
        retrievedContacts.add(ContactModel.fromJson(contacts[i]));
      }

      return retrievedContacts;
    }
    catch(ex){
      throw QueryException();
    }
  }




}