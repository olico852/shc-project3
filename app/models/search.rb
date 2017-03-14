class Search < ApplicationRecord

    def search_caregivers_attributes
      caregivers = Caregiver.all
      caregivers = caregivers.where("yearsofexperience >= ?", yearsofexperience) if yearsofexperience.present?
      caregivers = caregivers.where("lower(gender) LIKE ?", gender.downcase) if gender.present?
      if self.specialties.present?
        arr = JSON.parse(self.specialties)
        p 'arr contains ...'
        puts arr.length
        if arr.length > 1 # cos there's alaways a blank string being submitted.
          caregiversSpecialty = CaregiversSpecialties.where(specialty_id: arr.map {|x|  x.to_i}).pluck(:caregiver_id)
          p 'caregivers located...? '
          p caregiversSpecialty
          caregivers = caregivers.where(id: caregiversSpecialty)
        end
      end
      if self.languages.present?
        arr = JSON.parse(self.languages)
        if arr.length > 1  # cos there's alaways a blank string being submitted.
          caregiversLanguages = CaregiversLanguages.where(language_id: arr.map {|x|  x.to_i}).pluck(:caregiver_id)
          p 'caregivers located...? '
          p caregiversLanguages
          caregivers = caregivers.where(id: caregiversLanguages)
        end
      end

      return caregivers
    end

end
