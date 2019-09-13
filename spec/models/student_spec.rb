require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'attributes' do
    it 'has a name' do
      name = 'BurgerU'
      student = Student.create(name: name)
      expect(student.name).to eq(name)
    end

    it 'has a gpa' do
      gpa = 4.0
      student = Student.create(gpa: gpa)
      expect(student.gpa).to eq(gpa)
    end

    it 'has a student number' do
      student_number = 1234
      student = Student.create(student_number: student_number)
      expect(student.student_number).to eq(student_number)
    end

    it 'has a student id' do
      student_id = 123
      student = Student.create(student_id: student_id)
      expect(student.student_id).to eq(student_id)
    end

  describe "vaildations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :gpa }
    it { should validate_presence_of :student_number }
    it { should validate_presence_of :school_id }
  end
  
  describe "association" do
    it { should belongs_to(:schools) }
    it { should belongs_to(:schools).dependent(:destroy) }
  end

  describe "uniqueness" do
    Student.create!(name: 'foo', gpa: 4.0, student_number: 1234, school_id: 123)
    subject { Student.new(name: 'foo', gpa: 4.0, student_number: 1234, school_id: 123) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "numericality" do
    before(:each) do
      @school = School.create(name: 'foo', gpa: 4.0, student_number: 1234, school_id: 123)
    end
    
     it { should validate_numericality_of(:capacity) }
  end 
end

end