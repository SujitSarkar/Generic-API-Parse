import 'package:flutter/material.dart';
import 'package:generic_api_parse/model/employee_model.dart';
import 'package:generic_api_parse/model/product_model.dart';
import 'package:generic_api_parse/provider/api_service.dart';

class HomeProvider extends ChangeNotifier {
  static final ApiService apiService = ApiService();

  Future<void> onInit()async{
    await Future.wait([
      getEmployee(),
      getProduct()
    ]);
  }

  Future<void> getEmployee() async {
    try {
      final EmployeeModel employeeModel = await apiService.fetchAndParseData(
          'https://dummy.restapiexample.com/api/v1/employees',
          EmployeeModel.fromJson);
      debugPrint('Employee Status:::: ${employeeModel.status}');
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> getProduct() async {
    try {
      final ProductModel productModel = await apiService.fetchAndParseData(
          'https://dummyjson.com/products',
          ProductModel.fromJson);
      debugPrint('Product Total:::: ${productModel.total}');
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
