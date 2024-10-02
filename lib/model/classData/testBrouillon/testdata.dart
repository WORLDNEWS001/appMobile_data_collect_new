

class DataModelTest {


  List<dynamic> dataList = [];

  void addData(dynamic data) {
    dataList.add(data);
  }

  void mergeData(List<dynamic> newDataList) {
    dataList.addAll(newDataList);
  }

  List<dynamic> getData() {
    return dataList;
  }


}