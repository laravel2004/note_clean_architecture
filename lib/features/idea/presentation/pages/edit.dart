import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile/features/idea/domain/entities/idea.dart';
import 'package:mobile/features/idea/presentation/bloc/local/local_idea_bloc.dart';
import 'package:mobile/features/idea/presentation/bloc/local/local_idea_event.dart';

class EditIdeaPage extends StatefulWidget {
  const EditIdeaPage({Key? key, required this.idea}) : super(key: key);
  final Idea idea;

  @override
  State<EditIdeaPage> createState() => _EditIdeaPageState();
}

class _EditIdeaPageState extends State<EditIdeaPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late Idea idea;

  @override
  void initState() {
    idea = widget.idea;
    _titleController = TextEditingController(text: idea.title);
    _descriptionController = TextEditingController(text: idea.description);
    super.initState();
  }

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
        title: const Text("Melihat Ide"),
        actions: [
          GestureDetector(
            onTap: () {
              BlocProvider.of<LocalIdeaBloc>(context).add(DeleteIdea(idea: idea));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Delete Idea")),
              );
              Navigator.of(context).pop();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.delete_forever,
                color: Colors.red,
                size: 40.0,
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              final String title = _titleController.text;
              final String description = _descriptionController.text;
              DateTime now = DateTime.now();
              String formattedDate = DateFormat('dd/MM/yyyy').format(now);
              final Idea updatedIdea = Idea(
                id: idea.id,
                description: description,
                title: title,
                publishedAt: formattedDate,
                isImportant: true,
              );
              BlocProvider.of<LocalIdeaBloc>(context).add(UpdateIdea(idea: updatedIdea));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Update Idea")),
              );
              Navigator.of(context).pop();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.checklist,
                color: Colors.green,
                size: 40.0,
              ),
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController, // Hubungkan dengan TextEditingController
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
                  controller: _descriptionController, // Hubungkan dengan TextEditingController
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
            final Idea updatedIdea = Idea(
              id: idea.id,
              description: description,
              title: title,
              publishedAt: formattedDate,
            );
            BlocProvider.of<LocalIdeaBloc>(context).add(UpdateIdea(idea: updatedIdea));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Update Idea")),
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