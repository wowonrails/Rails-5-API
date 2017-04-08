require 'rails_helper'

RSpec.describe Todo, type: :model do
  it { expect have_many(:items).dependent(:destroy) }
  it { expect validate_presence_of(:title) }
  it { expect validate_presence_of(:created_by) }
end
