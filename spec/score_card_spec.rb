require_relative "../lib/score_card"

RSpec.describe ScoreCard do
  describe "pins_knocked_over" do
    it "returns 120 when a perfect game" do
      expect(described_class.pins_knocked_over("X X X X X X X X X XXX")).to eq(120)
    end

    it "returns 105 when all spares and bonus roll is 5" do
      expect(described_class.pins_knocked_over("5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/ 5/5")).to eq(105)
    end

    it "returns 110 when all spares and bonus roll is a strike" do
      card = "-/ 1/ 2/ 3/ 4/ 5/ 6/ 7/ 8/ 9/ X"
      expect(described_class.pins_knocked_over(card)).to eq(110)
    end

    it "returns 0 when all gutters indicated by single dash" do
      expect(described_class.pins_knocked_over("- - - - - - - - - -")).to eq(0)
    end

    it "returns 0 when all gutters indicated by double dash" do
      expect(described_class.pins_knocked_over("-- -- -- -- -- -- -- -- -- --")).to eq(0)
    end

    it "returns 0 when all gutters indicated by mix of single and double dash" do
      expect(described_class.pins_knocked_over("- -- - -- - -- - -- - --")).to eq(0)
    end

    it "returns 90 when all frames open" do
      expect(described_class.pins_knocked_over("9- 81 72 63 54 45 36 27 18 -9")).to eq(90)
    end

    it "returns 65 when open frames and bonus roll" do
      expect(described_class.pins_knocked_over("11 21 31 41 51 61 71 81 91 9/X")).to eq(65)
    end

    it "returns 95 when the example game" do
      expect(described_class.pins_knocked_over("X 7/ 9- X -8 8/ - 72 X X81")).to eq(95)
    end

    it "returns 96 when the last roll is a spare" do
      expect(described_class.pins_knocked_over("X 7/ 9- X -8 8/ - 72 X X8/")).to eq(96)
    end

    it "returns 97 when the last frame contains a spare" do
      expect(described_class.pins_knocked_over("X 7/ 9- X -8 8/ - 72 X 8/1")).to eq(97)
    end
  end
end
