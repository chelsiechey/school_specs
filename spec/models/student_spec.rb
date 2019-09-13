require 'rails_helper'

RSpec.describe Student, type: :model do
  # describe 'attributes' do
  #   it 'has a name' do
  #     expect(FactoryBot.create(:student).name).to eq("MyString")
  #   end

  #   it 'has a gpa' do
  #     expect(FactoryBot.create(:student).gpa).to eq(1.5)
  #   end

  #   it 'has a student number' do
  #     expect(FactoryBot.create(:student).student_number).to eq(1)
  #   end

  #   it 'goes to a school' do
  #     expect(FactoryBot.create(:student).school_id).to eq(1)
  #   end
  # end

    it { should respond_to :name } 
    it { should respond_to :student_number } 
    it { should respond_to :gpa } 
    it { should respond_to :school_id } 


  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :student_number }
    it { should validate_presence_of :gpa }
    it { should validate_uniqueness_of :name }

    it 'has a student number lower bound' do
      should validate_numericality_of(:student_number).
      is_greater_than_or_equal_to(0)
    end

    it 'has a student number higher bound' do
      should validate_numericality_of(:student_number).
      is_less_than_or_equal_to(10000)
    end
  end

  describe "association" do
    it { should belong_to(:school) }
    it { should belong_to(:school).dependent(:destroy) }
  end



end

