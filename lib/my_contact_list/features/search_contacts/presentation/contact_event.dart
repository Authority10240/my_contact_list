part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  ContactEvent();
}

class GetAllContacts extends ContactEvent{
  GetAllContacts();
}

class GetContactByName extends ContactEvent{
  final String name;

  GetContactByName(this.name);
}

class GetContactBySurname extends ContactEvent{
  final String surname;

  GetContactBySurname(this.surname);
}

class GetContactByCell extends ContactEvent{
  final String cell;

  GetContactByCell(this.cell);
}
