class Search < ApplicationRecord
  def search_caregivers

    caregivers = Caregiver.all
    caregivers = caregivers.where(["language LIKE ?", languages]) if language.present?
    caregivers = caregivers.where(["specialties LIKE ?", specialties]) if specialties.present?
    caregivers = caregivers.where(["yearsofexperience >= ?", yearsofexperience]) if yearsofexperience.present?
    caregivers = caregivers.where(["gender LIKE ?", gender]) if gender.present?

    return caregivers
  end
end
