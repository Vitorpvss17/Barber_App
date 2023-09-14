import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:murilobarberapp/data/post_provider.dart';
import 'package:murilobarberapp/screens/add_feed_screen.dart';
import 'package:murilobarberapp/screens/settings_page.dart';
import 'package:murilobarberapp/widgets/bottom_custom.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Future<void> _deletePost(String postId) async {
    try {
      await FirebaseFirestore.instance.collection('posts').doc(postId).delete();
    } catch (e) {
      print('Erro ao excluir o post: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    final now = DateTime.now();
    final twentyFourHoursAgo = now.subtract(const Duration(days: 1));


    return StreamBuilder<QuerySnapshot>(
        stream: firestore
            .collection('posts')
            .where('timestamp', isGreaterThan: twentyFourHoursAgo)
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SettingsPage()),
                      );
                    },
                    icon: const Icon(
                      Icons.account_circle,
                      color: Colors.black,
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Text(
                      'CORTES DO DIA',
                      style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    ),
                  ),
                ),
                body: const Center(child: Text('Erro ao carregar posts!!!')),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AddFeedScreen()),
                    );
                  },
                  child: const Icon(Icons.add),
                ),
                bottomNavigationBar: const CustomBottom());
          }

          final postDocs = snapshot.data?.docs;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              leading: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsPage()),
                  );
                },
                icon: const Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Text(
                  'CORTES DO DIA',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
              ),
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Background 6.jpg"),
                    fit: BoxFit.cover),
              ),
              child: ListView.builder(
                  itemCount: postDocs?.length ?? 0,
                  itemBuilder: (context, index) {
                    final postDoc = postDocs![index];
                    return _buildPostItem(postDoc);
                  }),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddFeedScreen()),
                );
              },
              child: const Icon(Icons.add),
            ),
            bottomNavigationBar: const CustomBottom(),
          );
        });
  }

  Widget _buildPostItem(DocumentSnapshot postDoc) {
    final data = postDoc.data() as Map<String, dynamic>?;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;
    String? currentUserEmail = user?.email;

    if (data == null) {
      return Container();
    }

    final postId = postDoc.id;
    final post = Post(
      email: data['email'] ?? '',
      imagePath: data['imagePath'] ?? '',
      comment: data['comment'] ?? '',
    );
    final bool isCurrentUserPost = currentUserEmail == post.email;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Text(post.email),
              SizedBox(
                width: double.maxFinite,
                height: 300,
                child: post.imagePath.isNotEmpty
                    ? Image.file(
                  File(post.imagePath),
                  fit: BoxFit.cover,
                )
                    : null,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 350.0),
                child: Text(
                  post.email,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              if (isCurrentUserPost)
                IconButton(
                  onPressed: () {
                    _showDeleteConfirmation(context, postId);
                    },
                  icon: const Icon(Icons.delete),
                ),
            ],
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text('${post.email}: ${post.comment}'),
          ),
          const SizedBox(height: 64),
        ],
      ),
    );
  }
  void _showDeleteConfirmation(BuildContext context, String postId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Exclusão'),
          content: const Text('Tem certeza de que deseja excluir este post?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _deletePost(postId);
                Navigator.of(context).pop();
              },
              child: const Text('Excluir'),
            ),
          ],
        );
      },
    );
  }
}
