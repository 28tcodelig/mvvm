abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // Sử dụng chia sẻ các biến chức năng thông qua mô hình view model
}

abstract class BaseViewModelInputs {
  void start(); //Được gọi trong khi init
  void dispose(); // Được gọi khi viewmodel dies.
}

abstract class BaseViewModelOutputs {}
