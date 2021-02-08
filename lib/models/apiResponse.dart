class APIResponse<T> {
  T data; // data returned from the API
  bool error; // checks to see if there is error or not
  String errorMessage; // gives us the error message if there is any

  APIResponse({this.data, this.error=false, this.errorMessage});

}
