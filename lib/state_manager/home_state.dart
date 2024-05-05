import 'package:flutter/material.dart';
import 'package:reqres_api/model/reqres_model.dart';
import 'package:reqres_api/screen/home_screen.dart';
import 'package:reqres_api/services/reqres_services.dart';

abstract class HomeState extends State<HomeScreen> {
  List<ReqresModel>? items;
  late final IReqresService reqresService;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    reqresService = ReqresService();
    fetchItemPostAdvance();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> fetchItemPostAdvance() async {
    changeLoading();
    items = await reqresService.fetchItemPostAdvance();
    changeLoading();
  }
}
