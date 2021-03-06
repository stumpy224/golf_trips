require 'rails_helper'

RSpec.describe Score, type: :model do

  let (:peninsula_hole_1) {holes(:peninsula_hole_1)}
  let (:team) {teams(:team_record_for_jeremiah_stump_peninsula_2018_first_day)}
  let (:score) {Score.new(team_id: team.id, hole_id: peninsula_hole_1.id)}

  it "should be valid" do
    expect(score.valid?).to be_truthy
  end

  it "should be invalid when team is blank" do
    score.team_id = ""
    expect(score.valid?).to be_falsey
  end

  it "should be invalid when hole is blank" do
    score.hole_id = ""
    expect(score.valid?).to be_falsey
  end

end
