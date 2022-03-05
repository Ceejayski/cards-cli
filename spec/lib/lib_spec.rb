# frozen_string_literal: true

RSpec.describe Cards do
  context "cli-functions" do
    array = [
      { "me": 1, "rarity": "unseen", "set": "10e", "colors": %w[red blue] },
      { "me": 2, "rarity": "unseen", "set": "10e", "colors": %w[red blue] },
      { "me": 3, "rarity": "seen", "set": "10g", "colors": %w[red blue] },
      { "me": 3, "rarity": "seen", "set": "10g", "colors": %w[red blue] },
      { "me": 6, "rarity": "common", "set": "KTK", "colors": %w[red blue] },
      { "me": 4, "rarity": "unseen", "set": "10e", "colors": %w[red blue] }
    ]
    it "expect group_by_set to group_cards by sets" do
      expect(subject::Magic.group_by_set(array).keys[0]).to eq("10e")
    end
    it "expect group_set_by_rarity to group cards set by rarity " do
      expect(subject::Magic.group_set_by_rarity(array)["10e"]["unseen"].size).to eq(3)
    end
    it "expect group_set_by_rarity to group_cards by " do
      expect(subject::Magic.group_by_set_colors(array).size).to eq(1)
    end
  end
end
