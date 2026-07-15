import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ka3da/features/nearby/presentation/cubit/location/location_cubit.dart';
import 'package:ka3da/features/nearby/presentation/cubit/location/location_state.dart';

class SearchSuggestions extends StatelessWidget {
  const SearchSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        final isSearching = state.searchQuery?.isNotEmpty ?? false;

        final data = isSearching ? state.restaurants : state.recentSearches;

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: data.isEmpty
              ? const SizedBox.shrink()
              : Container(
                  key: ValueKey(isSearching),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: const [
                      BoxShadow(blurRadius: 12, color: Colors.black12),
                    ],
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length > 6 ? 6 : data.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (_, index) {
                      final restaurant = data[index];

                      return ListTile(
                        leading: Icon(
                          isSearching ? Icons.search : Icons.history,
                        ),
                        title: Text(restaurant.name),
                        subtitle: Text(restaurant.category),
                        onTap: () {
                          context.read<LocationCubit>().addRecent(restaurant);
                        },
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
