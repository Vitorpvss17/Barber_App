import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:murilobarberapp/data/post_provider.dart';
import 'package:murilobarberapp/widgets/anexo.dart';
import 'package:provider/provider.dart';
import 'feed_screen.dart';

class AddFeedScreen extends StatefulWidget {
  const AddFeedScreen({Key? key}) : super(key: key);

  @override
  State<AddFeedScreen> createState() => _AddFeedScreenState();
}

class _AddFeedScreenState extends State<AddFeedScreen> {
  late File arquivo = File('');
  final picker = ImagePicker();
  TextEditingController commentController = TextEditingController();

  Future getFileFromGallery(ImageSource source) async {
    final file = await picker.pickImage(source: source);

    if (file != null) {
      setState(() => arquivo = File(file.path));
    }
  }

  List<Post> posts = [];

  void addPost(File imageFile, String comment, String email) {
    final postProvider = Provider.of<PostProvider>(context, listen: false);
    postProvider.addPost(Post(
      email: email,
      imagePath: imageFile.path,
      comment: comment,
    ));

    final firestore = FirebaseFirestore.instance;
    firestore.collection('posts').add({
      'email': email,
      'imagePath': imageFile.path,
      'comment': comment,
      'timestamp': FieldValue.serverTimestamp(),
    });

    setState(() {
      arquivo = File('');
      commentController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Text(
            'CRIE UMA POSTAGEM',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (arquivo.path.isNotEmpty)
                        Anexo(
                          arquivo: arquivo,
                          key: null,
                        ),
                      ElevatedButton.icon(
                        onPressed: () => getFileFromGallery(ImageSource.camera),
                        icon: const Icon(Icons.photo_camera),
                        label: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text('Tire uma foto'),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          textStyle: const TextStyle(fontSize: 18.0),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('ou'),
                      ),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.attach_file),
                        label: const Text('Selecione um arquivo'),
                        onPressed: () =>
                            getFileFromGallery(ImageSource.gallery),
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                'Comente:',
              ),
              TextFormField(
                controller: commentController,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 56.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      String comment = commentController.text;
                      if (arquivo.path.isNotEmpty && comment.isNotEmpty) {
                        FirebaseAuth _auth = FirebaseAuth.instance;
                        User? user = _auth.currentUser;
                        if (user != null) {
                          String userEmail = user.email ?? '';
                          addPost(arquivo, comment, userEmail);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const FeedScreen()),
                          );
                        }
                      }
                    },
                    child: const Icon(Icons.add_circle_outline),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
