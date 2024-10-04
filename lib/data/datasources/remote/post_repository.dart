// import 'package:dartz/dartz.dart';
// import 'package:graphql_example/core/api/dio/dio_service.dart';
// import 'package:graphql_example/data/models/dio_model/posts.dart';

// class PostRepository {
//   final ApiService apiService;

//   PostRepository(this.apiService);

//   Future<Either<Exception, List<Post>>> getPosts() async {
//     try {
//       final posts = await apiService.fetchPosts();
//       return Right(posts);
//     } catch (e) {
//       return Left(e as Exception);
//     }
//   }
// }
