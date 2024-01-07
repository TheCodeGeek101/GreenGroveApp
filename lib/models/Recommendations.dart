class Recommendations{
   final String imageUrl;
   final String recommendation;
   final String effect;
   final int recommendationsId;

   Recommendations(
       {
         required this.recommendation,
         required this.effect,
         required this.imageUrl,
         required this.recommendationsId
       });

   static List<Recommendations> recommendationsList = [
       Recommendations(
           recommendationsId:1,
           recommendation: 'Avoid Plastic Containers',
           effect: 'reduces 20% of of CO2',
           imageUrl: 'assets/images/recommendations.png'
       ),
      Recommendations(
         recommendationsId: 2,
         recommendation: 'Avoid Single-use plastics',
         effect: 'reduces 64% of of CO2',
         imageUrl: 'assets/images/recommendations.png'
      ),
      Recommendations(
         recommendationsId:3,
         recommendation: 'Avoid Plastic Containers',
         effect: 'reduces 20% of of CO2',
         imageUrl: 'assets/images/recommendations.png'
     ),

   ];
}