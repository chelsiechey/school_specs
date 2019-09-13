require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

  let(:valid_attributes) {
    { 
      name: 'Crush', 
      gpa: 4.0, 
      student_number: 1234,
      school_id: 100,
    }
  }

  let(:invalid_attributes) {
    { 
      name: '', 
      gpa: 4.0, 
      student_number: 1234,
      school_id: 100,
    }
  }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns http success" do
      student = Student.create! valid_attributes
      get :show, params: { id: student.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      student = Student.create! valid_attributes
      get :edit, params: { id: student.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new student" do
        expect {
          post :create, params: { student: valid_attributes }
        }.to change(Student, :count).by(1)
      end

      it "redirects to the created student" do
        post :create, params: { student: valid_attributes }
        expect(response).to redirect_to(Student.last)
      end
    end

     context "with invalid params" do
      it "does not creates a new student" do
        expect {
          post :create, params: { student: invalid_attributes }
        }.to change(Student, :count).by(0)
      end

      it "redirects to new template" do
        post :create, params: { student: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { capacity: 250 }
      }

      it "update the student" do
        student = Student.create! valid_attributes
        put :update, params: {id: student.id, student: new_attributes }
        student.reload
        expect(student.capacity).to eq(new_attributes[:capacity])
      end

      it "redirect to the student updated" do
        student = student.create! valid_attributes
        put :update, params: {id: student.id, student: valid_attributes }
        expect(response).to redirect_to(student)
      end
    end

    context "with invalid params" do
      it "does not update the student" do
        student = Student.create! valid_attributes
        put :update, params: {id: student.id, student: invalid_attributes }
        student.reload
        expect(student.name).to_not eq(invalid_attributes[:name])
      end

      it "redirect to the edit form" do
        student = Student.create! valid_attributes
        put :update, params: {id: student.id, student: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

   describe "DELETE #destroy" do
    it "destroys the requested student" do
      student = Student.create! valid_attributes
      expect {
        delete :destroy, params: {id: student.id}
      }.to change(Student, :count).by(-1)
    end

    it "redirects to the student list" do
      student = student.create! valid_attributes
      delete :destroy, params: {id: student.id}
      expect(response).to redirect_to(students_url)
    end
  end

end