class Queries {
  Queries._();

  static String getUsers = '''
      query {
        getUsers {
          id
          name
          email
        }
      }
    ''';

  static String getCountries = r'''
      query GetCountries {
        countries {
          name
          code
        }
      }
    ''';

  static String charactersQuery = '''
  query (\$page: Int!){
    characters(page: \$page){
      results{
        id
        name
        status
        gender
        type
        species
        image
      }
    }
  }
  ''';
}
