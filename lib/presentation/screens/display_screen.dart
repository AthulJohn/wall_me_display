import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/bloc/site_data/sitedata_cubit.dart';
import '/models/workshop/singlenote_model.dart';

import '../templates/template_1_display.dart';

class DisplayScreen extends StatelessWidget {
  const DisplayScreen({super.key, this.siteUrl});
  final String? siteUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<SitedataCubit>(
          create: (context) => SitedataCubit()..loadSiteData(siteUrl ?? "demo"),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: BlocBuilder<SitedataCubit, SitedataState>(
                builder: (context, state) {
              if (state is SitedataInitial) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is SitedataLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is SitedataError) {
                if (state.errorText.startsWith('404')) {
                  return const Center(
                      child: Text(
                          "Nothing in this Url! Want to create something?"));
                } else {
                  return Center(child: Text("Error: ${state.errorText}"));
                }
              }
              if (state is SitedataSuccess) {
                if (state.notes.isEmpty) {
                  return const Center(child: Text("No data"));
                }
              }

              return ListView(
                children: [
                  for (SingleNote note in state.notes)
                    if (note.templateId != -1)
                      AspectRatio(
                        aspectRatio: MediaQuery.of(context).size.width /
                            MediaQuery.of(context).size.height,
                        child: ViewTemplate1(
                          note: note,
                        ),
                      ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
