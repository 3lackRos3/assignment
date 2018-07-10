require 'rails_helper'

# Test suite for the Task model
RSpec.describe Task, type: :model do
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:priority) }
  it { should validate_presence_of(:status) }
end