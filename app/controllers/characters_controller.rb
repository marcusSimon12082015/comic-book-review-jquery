class CharactersController
  def update_characters
    @characters = Character.where('publisher_id = ?',params[:publisher_id])
    respond_to do |format|
      format.js
    end
  end
end
