class Activities{
    final int activityId;
   final String activity;
   final String imageURL;
   final String effect;

   Activities({
     required this.activity,
     required this.imageURL,
     required this.effect,
     required this.activityId
  });

   static List<Activities>  recentActivities = [
         Activities(
           activityId:1,
           activity:'Electricity',
           imageURL:'assets/images/plugin.jpg',
           effect:'350 n2c points',
         ),
         Activities(
           activityId:2,
           activity:'Water',
           imageURL:'assets/images/drop.jpg',
           effect:'180 n2c points',
         ),
         Activities(
           activityId:3,
           activity:'Food',
           imageURL:'assets/images/food.png',
           effect:'170 n2c points',
         ),
         Activities(
           activityId:4,
           activity:'Trash',
           imageURL:'assets/images/trash.png',
           effect:'680 n2c points',
         ),
         Activities(
           activityId:5,
           activity:'Transportation',
           imageURL:'assets/images/car.png',
           effect:'400 n2c points',
         ),

   ];

}