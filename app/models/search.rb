class Search < ApplicationRecord

  # Functions that belong to every instance

  # def search_caregivers_languages
  #   language = Language.where(sglang: self.language) if self.language.present?
  #   # language.each do |c|
  #   #   puts c.caregivers
  #   # end
  # end
  #
  # def search_caregivers_specialties
  #   p self.specialties
  #   specialties = Specialty.where(ability: self.specialties) if self.specialties.present?
  #   # return specialties
  # end
  #
  # def search_caregivers_attributes
  #   caregivers = Caregiver.all
  #   caregivers = caregivers.where(gender: self.gender) if gender.present?
  #   caregivers = caregivers.where(yearsofexperience: self.yearsofexperience) if yearsofexperience.present?
  #   return caregivers
  # end

  # def search_caregivers_languages
  #   p 'hello' * 150
  #   p self.language
  #   language = Language.where(sglang: self.language) if self.language.present?
  # end
  #
  # def search_caregivers_specialties
  #   p 'BYE' * 150
  #   p self.specialties
  #   specialties = Specialty.where(ability: self.specialties) if self.specialties.present?
  # end

    def search_caregivers_attributes
      caregivers = Caregiver.all
      # caregivers = caregivers.where(gender: self.gender) if gender.present?
      # caregivers = caregivers.where(yearsofexperience: self.yearsofexperience) if yearsofexperience.present?
      caregivers = caregivers.where(["yearsofexperience >= ?", yearsofexperience]) if yearsofexperience.present?
      caregivers = caregivers.where(["gender LIKE ?", gender]) if gender.present?
      return caregivers
    end



end
