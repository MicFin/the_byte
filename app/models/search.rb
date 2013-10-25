class Search < ActiveRecord::Base
  belongs_to :user
  # add error  messagse for not valid inputs


  # def self.yummly_search_criteria
  #   @allergy_criteria = Array.new
  #   @diet_criteria = Array.new
  #   @xingredlist_criteria = Array.new
  #   current_user.members.each do |member|
  #     @allergy_criteria << member.allergy
  #     @diet_criteria << member.diet
  #     @xingredlist_criteria << member.xingredlist
  #   end
  #   @allergy_criteria.flatten
  #   @diet_criteria.flatten
  #   @xingredlist_criteria.flatten

  #   @yummly_search_criteria = Hash.new
  #   # @yummly_search_criteria[:allowedIngredient] = @ingredlist_criteria
  #   @yummly_search_criteria[:excludedIngredient] = @xingredlist_criteria
  #   @yummly_search_criteria[:allowedAllergy] = @allergy_criteria
  #   @yummly_search_criteria[:allowedDiet] = @diet_criteria
  #   @yummly_search_criteria[:requirePictures] = true
  #   return @yummly_search_criteria
  #   # combines filters of members
  #   # results in format for API search
  # end

  # def self.new
  #   return Yummly.search(yummly_search_criteria)
  # end

end
