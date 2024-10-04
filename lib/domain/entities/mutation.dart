class Mutation {
  Mutation._();

  static String createUser = '''
      mutation(\$name: String!, \$email: String!) {
        createUser(name: \$name, email: \$email) {
          id
          name
          email
        }
      }
    ''';

    static String deleteUser = '''
      mutation(\$id: Int!) {
        deleteUser(id: \$id)
      }
    ''';
}
