

import '../api/base_api.dart';
import '../model/cases.dart';
import '../utils/api_value.dart';

class PandemicService {
  final BaseApi _baseApi = BaseApi();
  final String _urlBase = ApiValue.baseurl_covid; 


  Future<Cases> fetchPandemicCountry(String country, {Map<String, dynamic> params}) async {
    try {
      var urlCases = _urlBase + ApiValue.indonesia_cases_covid_all;
      final result = await _baseApi.getService(urlCases + country, params: params);
      print(result);
      return Cases.fromJson(result);
    } on Exception catch (e){
      throw Exception(e);
    }
  }
}