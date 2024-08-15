enum Endpoint {
  users,
  games;

  String get path {
    switch (this) {
      case Endpoint.users:
        return "users";
      case Endpoint.games:
        return "games";
    }
  }
}
