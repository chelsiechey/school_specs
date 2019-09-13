class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  # GET /schools
  def index
    @schools = School.all
  end

  def show
<<<<<<< HEAD
=======

>>>>>>> 6902072ddbe577d33cb4f0ab3368b26312bc963d
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to @school
    else
      render :new
    end
  end

  def edit
<<<<<<< HEAD
=======

>>>>>>> 6902072ddbe577d33cb4f0ab3368b26312bc963d
  end

  def update
    if @school.update(school_params)
      redirect_to @school
    else
      render :edit
    end
  end

  def destroy
    @school.destroy
    redirect_to schools_path
  end
<<<<<<< HEAD
=======

>>>>>>> 6902072ddbe577d33cb4f0ab3368b26312bc963d

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end
<<<<<<< HEAD
=======

    def school_params
      params.require(:school).permit(:name, :address, :principal, :capacity, :private_school)
    end
>>>>>>> 6902072ddbe577d33cb4f0ab3368b26312bc963d

    def school_params
      params.require(:school).permit(:name, :address, :principal, :capacity, :private_school)
    # Only allow a trusted parameter "white list" through.
    end
 end