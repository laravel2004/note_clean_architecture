import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mobile/features/idea/presentation/bloc/local/local_idea_bloc.dart';
import 'package:mobile/features/idea/presentation/bloc/local/local_idea_state.dart';
import 'package:mobile/features/idea/presentation/widget/card_idea.dart';

class IdeaPage extends StatelessWidget {
  const IdeaPage({super.key});


  @override
  Widget build(BuildContext context) {


    return BlocBuilder<LocalIdeaBloc, LocalIdeaState>(
      builder: (_, state) {
        if(state is LocalIdeaLoading) {
          return const Center(child: CupertinoActivityIndicator(),);
        }
        if(state is LocalIdeaDone) {
           return state.idea!.isEmpty ? const Center(child: Text("No data"),) : 
           Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                    child: MasonryGridView.count(
                      crossAxisCount: 2,
                     mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      itemCount: state.idea?.length,
                      itemBuilder: (context, index) {
                        final idea = state.idea![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/edit_idea", arguments: idea);
                          },
                          child: CardIdea(title: idea.title!, publishedAt: idea.publishedAt!,index: idea.id!,isImportant: idea.isImportant!,),
                        );
                      },
                    ),
                  ),
              ]
            ),
          );
        }
        else {
          return const Center(
            child:  Text("Server Internal Error"),
          );
        }
      },
    );
  }
}