import 'package:flutter/material.dart';
import 'package:reqres_api/model/reqres_model.dart';
import 'package:reqres_api/product/language/language_item.dart';
import 'package:reqres_api/state_manager/home_state.dart';
import 'package:reqres_api/widget/naw_drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends HomeState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NawDrawer(),
      appBar: AppBar(
        title: Text(LanguageItem.reqresApiUses.languageItem()),
      ),
      body: isLoading ? const Center(child: CircularProgressIndicator.adaptive()) : _ListView(items: items),
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView({
    super.key,
    required this.items,
  });

  final List<ReqresModel>? items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items?.length ?? 0,
      itemBuilder: (context, index) {
        return _Card(model: items?[index]);
      },
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    super.key,
    required ReqresModel? model,
  }) : _model = model;

  final ReqresModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(_model?.avatar ?? ''),
        ),
        title: Row(children: [
          Padding(
            padding: _WidgetPadding().onlyRightPaddingMin,
            child: Text(_model?.firstName ?? ''),
          ),
          Text(_model?.lastName ?? ''),
        ]),
        subtitle: Text(_model?.email ?? ''),
        trailing: const Icon(
          Icons.edit,
          color: _ColorWidget.blueColor,
        ),
      ),
    );
  }
}

class _WidgetPadding {
  final onlyRightPaddingMin = const EdgeInsets.only(right: 4.0);
}

class _ColorWidget {
  static const blueColor = Color.fromARGB(255, 0, 4, 252);
}
