require 'rails_helper'

RSpec.describe ExternalDocument, type: :model do
  it { is_expected.to belong_to(:incident) }
end
