class DicItemTitle
  require "rexml/document"

  ITEM_ID = "/DicItemTitle/ItemID"
  LOC_ID = "/DicItemTitle/LocID"
  TITLE = "/DicItemTitle/Title/span"

  def parse(xml)
    @itemId = ""
    @locId = ""
    @title = ""

    doc = REXML::Document.new(xml)

    if(doc.elements[ITEM_ID].text)
      @itemId = doc.elements[ITEM_ID].text
    end

    if(doc.elements[LOC_ID].text)
      @locId = doc.elements[LOC_ID].text
    end

    if(doc.elements[TITLE].text)
      @title = doc.elements[TITLE].text
    end
  end

  attr_reader :itemId, :locId, :title
end