class Search < ApplicationRecord
  # def get_caregiver_languages(id)
  #   caregiver = Caregiver.find(id)
  #   languages = caregiver.languages
  #
  #   return languages
  # end

  # Functions that belong to every instance
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

  # def self.search(search_project, search_client)
  #   return scoped unless search_project.present? || search_client.present?
  #   where(['project_name LIKE ? AND client LIKE ?', "%#{search_project}%", "%#{search_client}%"])
  # end

    def search_caregivers_attributes
      caregivers = Caregiver.all
      # caregivers = caregivers.where(gender: self.gender) if gender.present?
      # caregivers = caregivers.where(yearsofexperience: self.yearsofexperience) if yearsofexperience.present?
      caregivers = caregivers.where(["yearsofexperience >= ?", yearsofexperience]) if yearsofexperience.present?
      caregivers = caregivers.where(["gender LIKE ?", gender]) if gender.present?
      # specialties = Specialty.where(ability: self.specialties) if self.specialties.present?
      # @caregivers = CaregiversSpecialties.all.where(specialty_id: specialties).where(caregiver_id: caregivers)
      # debugger
      return caregivers
    end

end
