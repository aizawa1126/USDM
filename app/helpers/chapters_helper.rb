module ChaptersHelper
  def hasSections?
    @chapter.sections.count != 0
  end

  def hasRequirements? section
    section.requirements.count != 0
  end

  def rowspan section_id
    row_count = 0
    section = @chapter.sections.find(section_id)
    section.requirements.order("number").each do |requirement|
      row_count += 3
      requirement.functions.each do |function|
        row_count += 1
        function.specs.each do |spec|
          row_count += 1
        end
      end
    end
    row_count
  end
end
