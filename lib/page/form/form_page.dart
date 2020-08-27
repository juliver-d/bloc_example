import 'package:bloc_demo/page/form/repository/form_repository.dart';
import 'package:bloc_demo/page/form/widget/form_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/blocs.dart';

///表单页面
class FormPage extends StatelessWidget {
  final repo = FormRepository();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FormBloc>(
          create: (ctx) => FormBloc(repo: repo)..add(FormDataRequestEvent()),
        ),
        BlocProvider<SubmitBloc>(
          create: (ctx) => SubmitBloc(repo: repo),
        ),
      ],
      child: FormContent(),
    );
  }
}
