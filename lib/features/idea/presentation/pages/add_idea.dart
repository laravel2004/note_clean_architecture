import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile/features/idea/domain/entities/idea.dart';
import 'package:mobile/features/idea/presentation/bloc/local/local_idea_bloc.dart';
import 'package:mobile/features/idea/presentation/bloc/local/local_idea_event.dart';

class AddIdeaPage extends StatefulWidget {
  const AddIdeaPage({Key? key}) : super(key: key);

  @override
  State<AddIdeaPage> createState() => _AddIdeaPageState();
}

class _AddIdeaPageState extends State<AddIdeaPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Ide"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    hintText: "Judul",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    hintText: "Deskripsi",
                    contentPadding: EdgeInsets.symmetric(vertical: 30),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          if (_formKey.currentState!.validate()) {
            final String title = _titleController.text;
            final String description = _descriptionController.text;
            DateTime now = DateTime.now();
            String formattedDate = DateFormat('dd/MM/yyyy').format(now);
            final Idea idea =
                Idea(description: description, title: title, publishedAt: formattedDate,isImportant: false);
            BlocProvider.of<LocalIdeaBloc>(context).add(AddIdea(idea: idea));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Saving Idea")),
            );
            Navigator.of(context).pop();
          }
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.white, Color.fromRGBO(12, 132, 188, 1)],
            ),
          ),
          child: const Icon(
            Icons.save,
            size: 30,
          ),
        ),
      ),
    );
  }
}
