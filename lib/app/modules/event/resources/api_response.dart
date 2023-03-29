class ApiResponse<T> {
  Status status;
  T? data;
  String? message;
  bool showLoader = false;
  bool showPaginationLoader = false;

  ApiResponse.hasData({
    this.message,
    this.data,
    this.showLoader = false,
    this.showPaginationLoader = false,
  }) : status = Status.hasData;

  ApiResponse.loading()
      : showLoader = true,
        showPaginationLoader = false,
        status = Status.loading;

  ApiResponse.error(this.message,
      {this.showLoader = false, this.showPaginationLoader = false})
      : status = Status.error;

  ApiResponse(this.message)
      : status = Status.noData,
        showLoader = false,
        showPaginationLoader = false;

  @override
  String toString() {
    return "Status : $status  Message : $message  Data : $data";
  }
}

enum Status { hasData, error, loading, noData }

enum LOADER { show, hide, idle }
