import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../models/categories_model.dart';
import '../models/user_model.dart';
import '../repositories/authentication_respository.dart';
import 'authentication_bloc.dart';

// Events
abstract class CategoriesEvent {}

class FetchCategories extends CategoriesEvent {}

// States
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<Category> categories;

  CategoriesLoaded(this.categories);
}

class CategoriesError extends CategoriesState {
  final String error;

  CategoriesError(this.error);
}

// Bloc
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final AuthenticationRepository authenticationRepository;
  final AuthenticationBloc authenticationBloc;

  CategoriesBloc({
    required this.authenticationRepository,
    required this.authenticationBloc,
  }) : super(CategoriesInitial()) {
    on<FetchCategories>(_onFetchCategories); // Register the event handler
  }

  void _onFetchCategories(
      FetchCategories event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoading());

    try {
      if (state is AuthenticationInitial) {
        final authState = state as AuthenticationInitial;
        final phone = authState.phone;
        final password = authState.password;

        final user = await authenticationRepository.signIn(phone, password);
        final categories = await fetchCategoriesFromAPI(user.token);
        emit(CategoriesLoaded(categories));
      }
      else {
      emit(CategoriesError('Authentication state is not available.'));
    }
    } catch (error) {
      emit(CategoriesError('Failed to fetch categories: $error'));
    }
  }

  Future<List<Category>> fetchCategoriesFromAPI(String token) async {
    final response = await http.get(
        Uri.https('stagingapi.chipchip.social', '/v1/categories'),
        headers: {
          'Content-Type': 'application/json',

          'Authorization': token, 
        });

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      print("Response Body:");
      print(responseBody);
      return []; // You should parse the response and return the actual data.
    } else {
      throw 'Failed to fetch categories';
    }
  }
}
