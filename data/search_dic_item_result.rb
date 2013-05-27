class SearchDicItemResult
  require "rexml/document"
  require_relative "./dic_item_title"

  ERROR_MESSAGE = "/SearchDicItemResult/ErrorMessage"
  TOTAL_HIT_COUNT = "/SearchDicItemResult/TotalHitCount"
  ITEM_COUNT = "/SearchDicItemResult/ItemCount"
  ITEM_TITLE = "/SearchDicItemResult/TitleList/DicItemTitle"

  def parse(xml)
    doc = REXML::Document.new(xml)

    if(doc.elements[ERROR_MESSAGE].text)
      @errorMessage = doc.elements[ERROR_MESSAGE].text
    else
      @errorMessage = ""
    end

    @totalHitCount = doc.elements[TOTAL_HIT_COUNT].text
    @itemCount = doc.elements[ITEM_COUNT].text
    @titleList = []

    doc.elements.each(ITEM_TITLE) do |element|
      dicItemTitle = DicItemTitle.new()
      dicItemTitle.parse(element.to_s())
      @titleList.push(dicItemTitle)
    end
  end

  attr_reader :errorMessage, :totalHitCount, :itemCount, :titleList
end
