const baseUrl = "http://10.10.6.62:8080";

// Uri uriBitcoinNews() {
//   return Uri.parse("https://newsapi.org/v2/everything?q=bitcoin&apiKey=2afb93176dcd4198b16ccae08f9ddc99&pageSize=5");
// }
//
// Uri uriAppleNews(int pageSize, int page) {
//   return Uri.parse("https://newsapi.org/v2/everything?q=apple&apiKey=2afb93176dcd4198b16ccae08f9ddc99&pageSize=$pageSize&page=$page");
// }


Uri uriNewNews() {
  return Uri.parse("${baseUrl}/news");
}

Uri uriAnotherNews(int pageSize, int page) {
  return Uri.parse("${baseUrl}/news/$pageSize/$page");
}