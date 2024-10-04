class DeleteUserParams {
  final int id;

  DeleteUserParams({
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
