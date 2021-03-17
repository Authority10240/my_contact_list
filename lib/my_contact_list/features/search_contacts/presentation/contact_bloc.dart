import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_contact_list/my_contact_list/core/util/input_converter.dart';
import 'package:my_contact_list/my_contact_list/features/search_contacts/domain/entities/contact.dart';

part 'contact_event.dart';
part 'contact_state.dart';

const String DATABASE_FAILURE_MESSAGE = 'DATABASE_FAILURE';
const String INPUT_FAILURE_MESSAGE = 'INPUT_FAILURE_MESSAGE';
class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc(
  { @required this.getAllContact,
    @required this.getContactByCell,
    @required this.getContactByName,
    @required this.getContactBySurname,
    @required this.inputConverter}) :
        assert(getAllContact != null),
        assert(getContactBySurname != null),
        assert(getContactByName != null),
        assert(getContactByCell != null);

  final GetAllContacts getAllContact;
  final GetContactByCell getContactByCell;
  final GetContactByName getContactByName;
  final GetContactBySurname getContactBySurname;
  final InputConverter inputConverter;



  @override
  Stream<ContactState> mapEventToState(
    ContactEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }

  @override
  // TODO: implement initialState
  ContactState get initialState => Empty();


}
