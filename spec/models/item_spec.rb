require 'rails_helper'

RSpec.describe Item, type: :model do
  it { expect belong_to(:todo) }
  it { expect validate_presence_of(:name) }
end
