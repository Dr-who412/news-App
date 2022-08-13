abstract class Appstate {}
class initState extends Appstate{}
class bottomnavchange extends Appstate{}
class NewsLoadingBusiness extends Appstate{}
class NewsgetBusiness extends Appstate{}
class NewsErrorBusiness extends Appstate{
  late final String error;
  NewsErrorBusiness(this.error);
}
class NewsLoadingsport extends Appstate{}
class NewsgetSport extends Appstate{}
class NewsErrorSport extends Appstate{
  late final String error;
  NewsErrorSport(this.error);
}class NewsLoadingScience extends Appstate{}
class NewsgetScience extends Appstate{}
class NewsErrorScience extends Appstate{
  late final String error;
  NewsErrorScience(this.error);
}
class changeThem extends Appstate{}
class SearchLoadingsport extends Appstate{}
class SearchGet extends Appstate{}
class SearchErrorSport extends Appstate{
  late final String error;
  SearchErrorSport(this.error);
}