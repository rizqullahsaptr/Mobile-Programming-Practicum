import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_crud_api/main.dart';

void main() {
  test('Post.fromJson membaca respons API dan memberi userId default', () {
    final before = DateTime.now();
    final post = Post.fromJson({
      'id': 101,
      'title': 'Budi',
      'body': 'Programmer',
    });
    expect(post.id, 101);
    expect(post.title, 'Budi');
    expect(post.body, 'Programmer');
    expect(post.userId, 1);
    expect(post.createdAt.isBefore(before), isFalse);
    expect(post.createdAt.isAfter(DateTime.now()), isFalse);
  });
  test('Post.fromJson mempertahankan userId dari respons', () {
    final post = Post.fromJson({
      'id': 7,
      'userId': 4,
      'title': 'A',
      'body': 'B',
    });
    expect(post.userId, 4);
  });
}
