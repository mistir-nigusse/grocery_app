import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/categories_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        final categoriesBloc = context.read<CategoriesBloc>();
    categoriesBloc.add(FetchCategories());

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return CircularProgressIndicator();
          } else if (state is CategoriesLoaded) {
            // You can create a grid of cards based on the data in state.categories
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust the number of columns as needed
              ),
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final category = state.categories[index];
                return Card(
      child: Column(
        children: <Widget>[
       
          Text(category.name),
          // Image.network(category.imageUrl),
        ],
      ),
    );
              },
            );
          } else if (state is CategoriesError) {
            return Text('Error: ${state.error}');
          } else {
            return Text('No categories available');
          }
        },
      ),
    );
  }
}
