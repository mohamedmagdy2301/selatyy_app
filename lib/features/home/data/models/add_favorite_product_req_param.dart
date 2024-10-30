class AddFavoriteProductReqParam {
  int? favoId;

  AddFavoriteProductReqParam({this.favoId});

  Map<String, dynamic> toJson() => {
        'favo_id': favoId,
      };
}
