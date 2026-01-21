require_relative "../lib/score_card"

RSpec.describe ScoreCard do
  describe "full_score" do

    it "returns 300 when a perfect game" do
      expect(described_class.full_score("X X X X X X X X X XXX")).to eq(300)
    end


    it "returns 150 when all spares and bonus roll is 5" do
      expect(described_class.full_score("5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/5")).to eq(150)
    end


    it "returns 155 when all spares and bonus roll is a strike" do
      expect(described_class.full_score("-/ 1/ 2/ 3/ 4/ 5/ 6/ 7/ 8/ 9/X")).to eq(155)
    end


    it "returns 0 when all gutters indicated by single dash" do
      expect(described_class.full_score("- - - - - - - - - -")).to eq(0)
    end


    it "returns 0 when all gutters indicated by double dash" do
      expect(described_class.full_score("-- -- -- -- -- -- -- -- -- --")).to eq(0)
    end


    it "returns 0 when all gutters indicated by mix of single and double dash" do
      expect(described_class.full_score("- -- - -- - -- - -- - --")).to eq(0)
    end


    it "returns 90 when all frames open" do
      expect(described_class.full_score("9- 81 72 63 54 45 36 27 18 -9")).to eq(90)
    end


    it "returns 83 when open frames and bonus roll" do
      expect(described_class.full_score("11 21 31 41 51 61 71 81 45 9/X")).to eq(83)
    end


    it "returns 140 when the example game" do
      expect(described_class.full_score("X 7/ 9- X -8 8/ - 72 X X81")).to eq(140)
    end


    it "returns 141 when the last roll is a spare" do
      expect(described_class.full_score("X 7/ 9- X -8 8/ - 72 X X8/")).to eq(141)
    end

    it "returns 124 when the last frame contains a spare" do
      expect(described_class.full_score("X 7/ 9- X -8 8/ - 72 X 8/1")).to eq(124)
    end
  end
end
