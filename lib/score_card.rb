class ScoreCard
  # Counts the number of pins knocked over from a bowling score-card.
  #
  # Args:
  #   score_card: String
  #     A space-separated string of 10 frames.
  #
  # Returns: Integer
  #   The number of pins knocked over during the game.
  #
  # Possible frame scores:
  #   "X": strike
  #   "i/": spare (e.g. 5/)
  #   "ij": open frame (e.g. 54)
  #   "-": gutter ball(s)
  #
  # Example input:
  #   "X 7/ 9- X -8 8/ - 72 X X81"
  #
  # Note:
  #   You may assume all score-cards are valid.
  #   A single frame scoring "-" means two gutter balls were rolled.
  #   A strike or spare in the 10th frame unlocks a bonus roll.

  def self.pins_knocked_over(score_card)
    total_knocked_over = -1 # TODO: implement logic

    total_knocked_over
  end
end
