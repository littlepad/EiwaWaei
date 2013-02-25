require "./super_dictionary"

class Waei < SuperDictionary
  DIC = "EdictJE"
  RESULT_ELEMENT = "/GetDicItemResult/Body/div/div/div"

  def getDicItem
    result = open(getGetItemUrl())
    doc = REXML::Document.new(result)
    doc.elements.each(RESULT_ELEMENT) do |element|
      puts element.text
    end
  end

  def getSearchItemUrl
    return super + "&Dic=" + DIC
  end

  def getGetItemUrl
    return super + "&Dic=" + DIC
  end
end
