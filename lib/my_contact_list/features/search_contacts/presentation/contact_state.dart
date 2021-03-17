

part of 'contact_bloc.dart';


abstract class ContactState extends Equatable {
  ContactState();
}

class ContactInitial extends ContactState {
  @override
  List<Object> get props => [];
}

class Empty extends ContactState{

}

class Loading extends ContactState{

}

class Loaded extends ContactState{

  final List<Contact> contact;

  Loaded(this.contact);
}

class ErrorState extends ContactState{
  final String message;

  ErrorState({this.message});
}
