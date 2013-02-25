require "./super_dictionary"

class Eiwa < SuperDictionary
  DIC = "EJdict"
  RESULT_ELEMENT = "/GetDicItemResult/Body/div/div"

  def getDicItem
    result = open(getGetItemUrl())
    doc = REXML::Document.new(result)
    puts doc.elements[RESULT_ELEMENT].text
  end

  def getSearchItemUrl
    return super + "&Dic=" + DIC
  end

  def getGetItemUrl
    return super + "&Dic=" + DIC
  end
end
