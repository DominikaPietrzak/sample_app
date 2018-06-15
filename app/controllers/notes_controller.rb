class NotesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  def index
     @notes = Note.all
   end

   def new
       @note = Note.new
   end

   def create

     @note = current_user.notes.build(note_params)
     if @note.save
        @notes = Note.all
        render action: "index"
        flash[:success] = "Microposts created"
     else
       render 'new'
     end

   end

   def show
     @note = Note.find(params[:id])
   end

   def edit
     @note = Note.find(params[:id])
   end

   def destroy
     @note.destroy
     flash[:success] = "Notatka usunięta"
     @notes = Note.all
     render action: "index"
  end
 private
   def note_params
     params.require(:note).permit(:text)
   end
   def correct_user
     @note = current_user.notes.find_by(id: params[:id])
     redirect_to root_url if @note.nil?
   end

end
