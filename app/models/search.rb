class Search < ApplicationRecord
  def search_caregivers

    caregivers = Caregiver.all
    caregivers = Caregiver.where('id IN (SELECT DISTINCT caregiver_id FROM caregivers_languages WHERE language_id = languages.find_by(sglang))')
    caregivers = Caregiver.joins(:specialties).where(["specialty.ability LIKE?", ability]) if specialties.present?
    caregivers = caregivers.where(["yearsofexperience >= ?", yearsofexperience]) if yearsofexperience.present?
    caregivers = caregivers.where(["gender LIKE ?", gender]) if gender.present?

    return caregivers
  end
end
