import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/features/idea/domain/entities/lean_canvas.dart';
import 'package:mobile/features/idea/domain/repositories/idea_repository.dart';
import 'package:mobile/features/idea/domain/usecases/get_lean_canvas.dart';
import 'package:mobile/features/idea/presentation/widget/card_lean_canvas.dart';
import 'package:mobile/injection.container.dart';

class LeanCanvasPage extends StatefulWidget {
  const LeanCanvasPage({Key? key}) : super(key: key);

  @override
  State<LeanCanvasPage> createState() => _LeanCanvasPageState();
}

class _LeanCanvasPageState extends State<LeanCanvasPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  LeanCanvas? _leanCanvas;
  bool _isLoading = false;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lean Canvas"),
      ),
      body: _isLoading ? const Center(
        child: CupertinoActivityIndicator(),
      ) : 
      Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.multiline,
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate()) {
                      setState(() {
                        _isLoading = true;
                      });
                      final data = await GetLeanCanvasUseCase(sl.get<IdeaRepository>()).call(params: _titleController.text);
                      setState(() {
                        _leanCanvas = data;
                        _isLoading = false;
                      });
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Generate",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
                if (_leanCanvas != null)
                  Column(
                    children: [
                    const SizedBox(height: 20,), 
                    CardLeanCanvas(tema: "Key Metrics", title: _leanCanvas!.keyMetrics!),
                    CardLeanCanvas(tema: "Channels", title: _leanCanvas!.channels!),
                    const SizedBox(height: 10,), 
                    CardLeanCanvas(tema: "Costs Structure", title: _leanCanvas!.costStructure!),
                    const SizedBox(height: 10,), 
                    CardLeanCanvas(tema: "Customer Segments", title: _leanCanvas!.customerSegments!),
                    const SizedBox(height: 10,), 
                    CardLeanCanvas(tema: "Revenue Streams", title: _leanCanvas!.revenueStreams!),
                    const SizedBox(height: 10,), 
                    CardLeanCanvas(tema: "Unfair Advantage", title: _leanCanvas!.unfairAdvantage!),
                    const SizedBox(height: 10,), 
                    CardLeanCanvas(tema: "Unique Value Proposition", title: _leanCanvas!.uniqueValueProposition!),
                    const SizedBox(height: 10,), 
                    CardLeanCanvas(tema: "Solution", title: _leanCanvas!.solution!),
                    const SizedBox(height: 10,),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
