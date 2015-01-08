class SubjectsController < ApplicationController
  #layout false
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
  end

  def create
    # Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
    # If save succeeds, redirect to the index action
     flash[:notice] = "Subject created successfully."
     redirect_to(:action => 'index')
    # If save fails, redisplay the form so user can fix problems
    else
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @subject = Subject.find(params[:id])
    # Update the object
    if @subject.update_attributes(subject_params)
    # If save succeeds, redirect to the index action
     flash[:notice] = "Subject updated successfully."
     redirect_to(:action => 'show', :id => @subject.id)
    # If save fails, redisplay the form so user can fix problems
    else
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end


  private 

    def subject_params
      params.require(:subject).permit(:name, :position, :visible)
    end


end
