class ScoreCard
  # Calculate the full score from a bowling score-card.
  #
  # Args:
  #   score_card: String
  #     A space-separated string of 10 frames.
  #
  # Returns: Integer
  #   Representing the score of the game.
  #
  # Possible frame scores:
  #   "X": strike (10 + following 2 rolls)
  #   "i/": spare (10 + following roll)
  #   "ij": open frame (i+j)
  #   "-": gutter ball(s) (0)
  #
  #   * where i,j are between 1 and 9 and i+j < 10
  #
  # Example input:
  #   "X X X X X X X X X XXX" - the perfect game, scores 300.
  #   "X 7/ 9- X -8 8/ - 72 X X81" has a score of 140.
  #
  # Note:
  #   You may assume all score-cards are valid.
  #   A single frame scoring "-" means two gutter balls were rolled.
  #   A strike or spare in the 10th frame unlocks a bonus roll, but scores 10 only.

  def self.full_score(score_card)
    score_frames = score_card.split.map{|frame| frame.split(//) }
    score_frames = score_frames.map.with_index{|frame, i| transform_frame(frame, i) }
    # puts "score_frames:#{score_frames}"

    total_score = 0
    # Adding [nil, nil] to add up the scores of the last 2 elements
    (score_frames.flatten + [nil, nil]).each_cons(3) do |data|
      current = data.first
      result = if current[:frame_index] == 9
        data.first[:score]
      elsif current[:type] == :strike
        data.take(3).sum{|d| d[:score] }
      elsif current[:type] == :spare
        data.take(2).sum{|d| d[:score] }
      else
        data.first[:score]
      end
      # puts "#{current} -> #{result}"
      total_score += result
    end

    return total_score
  end

  def self.transform_frame(frame, i)
    transformed = frame.map.with_index do |str,j|
      result =
        case str
        when 'X'
          {
            score: 10,
            type: :strike
          }
        when '/'
          {
            score: 10 - frame[j-1].to_i,
            type: :spare
          }
        when '-'
          {
            score: 0
          }
        else
          {
            score: str.to_i
          }
        end
      result[:frame_index] = i

      result
    end

    # Rescue exceptinal case of score mistake. e.g. '91'(supposed to be 9/)
    if transformed.size == 2 && transformed.reject{|d| %i[strike spare].include?(d[:type]) }.sum{|d| d[:score] } == 10
      transformed[1][:type] = :spare
    end

    transformed
  end
end
