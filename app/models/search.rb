class Search < ApplicationRecord
  def search_caregivers

    caregivers = Caregiver.all
<<<<<<< HEAD
    # caregivers = caregivers.where(["language LIKE ?", languages]) if language.present?
    # caregivers = caregivers.where(["specialties LIKE ?", specialties]) if specialties.present?
    # caregivers = caregivers.where(["yearsofexperience >= ?", yearsofexperience]) if yearsofexperience.present?
    # caregivers = caregivers.where(["gender LIKE ?", gender]) if gender.present?
    caregivers = Caregiver.where('id IN (SELECT DISTINCT caregiver_id FROM caregivers_languages WHERE language_id = language.find_by(sglang))')

    caregivers = Caregiver.where('id IN (SELECT DISTINCT caregiver_id FROM caregivers_languages WHERE language_id = languages.find_by(sglang))')
    caregivers = Caregiver.joins(:specialties).where(["specialty.ability LIKE?", ability]) if specialties.present?
    caregivers = caregivers.where(["yearsofexperience >= ?", yearsofexperience]) if yearsofexperience.present?
    caregivers = caregivers.where(["gender LIKE ?", gender]) if gender.present?

    return caregivers
  end
end

# SELECT DISTINCT c.id
# FROM caregivers AS c
# INNER JOIN caregivers_languages AS cl ON (cl.caregiver_id = c.id)
# INNER JOIN languages AS l ON (l.id = cl.language_id)
# WHERE l.sglang = 'Chinese' ||'English';
#
#
# users = User.where('id IN (SELECT DISTINCT user_id FROM bars WHERE bars.foo_id!=?)', 5)
#
#
# caregivers = Caregiver.where('id IN (SELECT DISTINCT caregiver_id FROM caregivers_languages WHERE language_id = language.find_by(lang))')
#
# caregivers = Caregiver.where('id IN (SELECT DISTINCT caregiver_id FROM caregivers_languages WHERE language_id = language.find_by(id: 1))')
#
# caregivers = caregiver.where('id IN (SELECT DISTINCT caregiver_id FROM caregivers_languages WHERE language_id = language.find_by(id: 1))')
