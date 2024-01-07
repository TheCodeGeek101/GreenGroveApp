class Rewards{
  final String milestone;
  final String reward;
  final String imageURL;
  final int rewardsId;

  Rewards({
      required this.milestone,
      required this.reward,
      required this.rewardsId,
      required this.imageURL
  });

  static List<Rewards> rewardsList = [
        Rewards(
          rewardsId:1,
          milestone:'Milestone Achieved',
          reward:'Less Electricity usage',
          imageURL:'assets/images/milestones.png'
        ),
        Rewards(
            rewardsId:2,
            milestone:'Milestone Achieved',
            reward:'Driving fuel efficient vehicles',
            imageURL:'assets/images/milestones.png'
        ),
        Rewards(
            rewardsId:3,
            milestone:'Milestone Achieved',
            reward:'Less Electricity usage',
            imageURL:'assets/images/milestones.png'
        ),

    ];
}