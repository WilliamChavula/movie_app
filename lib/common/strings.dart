abstract class StringResource {
  const StringResource._();

  static const String appTitle = 'MOVIE';
  static const String trendingTitle = 'Trending Now';
  static const String upComingTitle = 'Upcoming Movies';
  static const String searchText = 'Search...';
  static const String movieStory = 'Movie Story:';
  static const String loading = 'Loading..';

  // chip tiles
  static const String allTile = 'All';
  static const String actionTile = 'Action';
  static const String adventureTile = 'Adventure';
  static const String animationTile = 'Animation';
  static const String comedyTile = 'Comedy';
  static const String fantasyTile = 'Fantasy';
  static const String romanceTile = 'Romance';

  // tabs
  static const String actorsTab = 'Actors';
  static const String similarMovies = 'Similar Movies';

  // error messages
  static const String noInternetError =
      'Your device does not have an active internet connection. Please try again later.';
  static const String fetchMovieError =
      'Could not fetch movies. Please try again later.';
  static const String fetchCastError =
      'Could not fetch the cast for this movie. Please try again later.';
  static const String fetchTrailerError =
      'Could not fetch the trailer for this movie. Please try again later.';
  static const String fetchGenresError =
      'Could not fetch genres. Please try again later.';
  static const String fetchMovieDetailError =
      'Could not fetch details for this movie. Please try again later.';
  static const String somethingWentWrong = "Something went wrong!";
  static const String movieListErrorMessage =
      "Something happened while trying to fetch movies. Please try again later.";
}

abstract class ImageResource {
  const ImageResource._();

  static const String menuIcon = 'assets/images/menu.png';
  static const String notificationIcon = 'assets/images/notification.png';
  static const String searchIcon = 'assets/images/search.png';
  static const String searchIconLight = 'assets/images/search_light.png';
  static const String filmReelIcon = 'assets/images/movie-film-reel.png';
  static const String parasiteHeroImage = 'assets/images/movie_banner_1.png';
  static const String netflix1899HeroImage = 'assets/images/1899.png';
  static const String avatarHeroImage = 'assets/images/avatar.png';
  static const String blackAdamHeroImage = 'assets/images/black_adam.png';
  static const String topGunHeroImage = 'assets/images/top_gun.png';
  static const String wakandaHeroImage = 'assets/images/wakanda.png';
  static const String placeholderImageDark =
      'assets/images/placeholder_image_dark.png';
  static const String placeholderImageLight =
      'assets/images/placeholder_image_light.png';
  static const String loadingAnimationImage = 'assets/images/loading.gif';
  static const String apiBaseImageUrl = 'https://image.tmdb.org/t/p/w342';
  static const String smApiBaseImageUrl = 'https://image.tmdb.org/t/p/w185';
  static const String youtubeUrl = 'https://www.youtube.com/watch?v=';
}
