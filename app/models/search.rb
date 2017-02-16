class Search < ApplicationRecord
  # def get_caregiver_languages(id)
  #   caregiver = Caregiver.find(id)
  #   languages = caregiver.languages
  #
  #   return languages
  # end

  def search_caregiver_languages
    puts "HELLO" * 80
    puts params

    # languages = Language.all
    languages = languages.where(['languages = ?', languages]) if languages.present?
    caregivers = languages.caregivers
   return caregivers
  end
end
