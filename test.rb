Caregiver.find( :all, :joins => :languages, :conditions => "languages.id = #{staff_id}" )


single or either or languages works:
SELECT DISTINCT c.id
FROM caregivers AS c
INNER JOIN caregivers_languages AS cl ON (cl.caregiver_id = c.id)
INNER JOIN languages AS l ON (l.id = cl.language_id)
WHERE l.sglang = 'Chinese' ||'English';

specialties search works
SELECT DISTINCT c.id
FROM caregivers AS c
INNER JOIN caregivers_specialties AS cs ON (cs.caregiver_id = c.id)
INNER JOIN specialties AS s ON (s.id = cs.specialty_id)
WHERE s.ability = 'Respite care';

# caregivers = caregivers.where(["language LIKE ?", languages]) if language.present?
caregivers = caregivers.joins(:languages).where(["language.sglang LIKE?", sglang]) if language.present?
# caregivers = caregivers.where(["specialties LIKE ?", specialties]) if specialties.present?
