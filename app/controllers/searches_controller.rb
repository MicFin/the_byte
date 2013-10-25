class SearchesController < ApplicationController
 
 def new
 end

 def create

  # captures search term/s for ingredient search
  @item_criteria = search_params

  # identifies which members to include in search
  active_members = params.map{ |k,v| v=='1' ? k : nil }.compact

  # creates arrays to combine member filters in
  @allergy_criteria = Array.new
  @diet_criteria = Array.new
  @xingredlist_criteria = Array.new

  # combines filters from member profiles
  active_members.each do |name|
    current_user.members.each do |member|
      if member.name == name
        aller = member.allergies
        aller.each do |allergy|
          @allergy_criteria << allergy.name
        end
        diet = member.diets
        diet.each do |diet|
          @diet_criteria << diet.name
        end
        # splits xingredlist into individual items
        @xingredlist_criteria << member.xingredlist.split(', ')
      end
    end
  end


  # creates hash to send filters to API
  @yummly_search_criteria = Hash.new

  # adds values to proper keys in hash
  @yummly_search_criteria[:excludedIngredient] = @xingredlist_criteria.flatten.uniq
  @yummly_search_criteria[:allowedAllergy] = @allergy_criteria.uniq
  @yummly_search_criteria[:allowedDiet] = @diet_criteria.uniq
  @yummly_search_criteria[:requirePictures] = true
binding.pry
  # returns hash ready for API 

# Yummly.search(@item_criteria, @yummly_search_criteria)
      binding.pry
end

private

 def search_params
  params.require(:search)
 end

end