class SearchesController < ApplicationController
 
 # when new is called, sends to view/searches/new.html.erb
 def new
 end

 def create

  # captures search term/s for ingredient search
  @item_criteria = search_params
  # identifies which members to include in search
  active_restrictions = params.map{ |k,v| v=='1' ? k : nil }.compact

  # creates arrays to combine member filters in
  @allergy_criteria = Array.new
  @diet_criteria = Array.new
  @xingredlist_criteria = Array.new
  @course_criteria = Array.new

  # combines filters from member profiles to search filter

    active_restrictions.each do |restriction|
      if current_user
      current_user.members.each do |member|
        if member.name == restriction
          aller = member.allergies
          aller.each do |allergy|
            @allergy_criteria << allergy.name
          end
          diet = member.diets
          diet.each do |diet|
            @diet_criteria << diet.name
          end
          # splits xingredlist from members into individual items and adds to search filter
          @xingredlist_criteria << member.xingredlist.split(', ')
        end
      end
      end
      # adds any individually added allergy restrictions to search filter
    Allergy.all.each do |allergy|   
      if allergy == restriction
        @allergy_criteria << restriction
      end
    end
    # adds any individually added diet restrictions to search filter
    Diet.all.each do |diet|
      if diet == restriction
        @diet_criteria << restriction
      end
    end
    # adds course restrictions to search filter
    $courses.each do |course|
      if course == restriction
        @course_criteria << restriction
      end
    end

  end


  # creates hash to send filters to API
  @yummly_search_criteria = Hash.new

  # adds values to proper keys in hash
  @yummly_search_criteria[:excludedIngredient] = @xingredlist_criteria.flatten.uniq
  @yummly_search_criteria[:allowedAllergy] = @allergy_criteria.uniq
  @yummly_search_criteria[:allowedDiet] = @diet_criteria.uniq
  @yummly_search_criteria[:allowedCourse] = @course_criteria
  @yummly_search_criteria[:requirePictures] = true

 # returns search results as value of create
 @search_results = Yummly.search(@item_criteria, @yummly_search_criteria)
 # renders page to the view/searches/show.html.erb
 render :show

 end


 private

  def search_params
   params.require(:search)
  end

end