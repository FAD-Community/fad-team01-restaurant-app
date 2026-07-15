import 'package:equatable/equatable.dart';
import 'package:ka3da/core/widgets/search/models/searchable.dart';

class SearchState<T extends Searchable> extends Equatable {
  final String query;

  final List<T> results;

  final List<T> suggestions;

  final List<String> recent;

  const SearchState({
    this.query = '',
    this.results = const [],
    this.suggestions = const [],
    this.recent = const [],
  });

  SearchState<T> copyWith({
    String? query,
    List<T>? results,
    List<T>? suggestions,
    List<String>? recent,
  }) {
    return SearchState<T>(
      query: query ?? this.query,
      results: results ?? this.results,
      suggestions: suggestions ?? this.suggestions,
      recent: recent ?? this.recent,
    );
  }

  @override
  List<Object?> get props => [query, results, suggestions, recent];
}
