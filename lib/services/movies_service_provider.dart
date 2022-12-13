import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'get_movies_impl.dart';

final movieServiceProvider = Provider<GetMoviesImpl>((ref) {
  return GetMoviesImpl();
});
