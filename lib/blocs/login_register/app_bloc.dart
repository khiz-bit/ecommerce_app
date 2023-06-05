import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/auth/auth.dart';
import 'package:ecommerce_app/auth/auth_error.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppStateLoggedOut(isLoading: true, successful: false)) {
    on<AppEventLogIn>((event, emit) async {
      emit(AppStateLoggedOut(isLoading: true, successful: false));
      try{
        await Auth().signInWithEmailAndPassword(email: event.email, password: event.password);
        emit(AppStateLoggedIn(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorLogin = e.toString();
        emit(AppStateLoggedOut(isLoading: false, successful: false));
      }
      // TODO: implement event handler
    });

    on<AppEventLogOut>((event, emit) async {
      emit(AppStateLoggedOut(isLoading: true, successful: false));
      try {
        await Auth().signOut();
        emit(AppStateLoggedOut(isLoading: false, successful: true));
      } on FirebaseAuthException catch(e) {

      }
      // TODO: implement event handler
    });

    on<AppEventRegister>((event, emit) async {
      emit(AppStateLoggedOut(isLoading: true, successful: false));
      try{
        await Auth().createUserWithEmailAndPassword(email: event.email, password: event.password);
        emit(AppStateLoggedIn(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorLogin = e.toString();
        emit(AppStateLoggedOut(isLoading: false, successful: false));
      }
      // TODO: implement event handler
    });

    on<AppEventResetPassword>((event, emit) async {
      emit(AppStateLoggedOut(isLoading: true, successful: false));
      try{
        await Auth().sendResetPasswordEmail(email: event.email);
        emit(AppStateLoggedIn(isLoading: false, successful: true));
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorLogin = e.toString();
        emit(AppStateLoggedOut(isLoading: false, successful: false));
      }
      // TODO: implement event handler
    });

  }
}
