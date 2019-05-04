module CharacterHelper
  def displayCharacterImage(character)
    character.character_image.file.nil? ? "/assets/image_not_available.jpg"
                                        : character.character_image.url.to_s
  end   
end
