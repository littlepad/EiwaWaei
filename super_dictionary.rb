class SuperDictionary
  require "uri"
  require "open-uri"
  require "rexml/document"
  require_relative "./data/search_dic_item_result"

  SEARCH_ITEM_URL = "http://public.dejizo.jp/NetDicV09.asmx/SearchDicItemLite?"
  GET_ITEM_URL = "http://public.dejizo.jp/NetDicV09.asmx/GetDicItemLite?"
  SCOPE = "HEADWORD"
  MATCH = "EXACT"
  MERGE = "AND"
  PROF = "XML"
  PAGE_SIZE = 1
  PAGE_INDEX = 0
  ITEM_ID_ELEMENT = "/SearchDicItemResult/TitleList/DicItemTitle/ItemID"
  ITEM_COUNT_ELEMENT = "/SearchDicItemResult/TotalHitCount"

  def initialize(word)
    if word == nil then
      word = ""
    end
    @word = word
  end

  def search
    searchDicItem()
  end

  protected
  def getDicItem
  end

  private
  def searchDicItem
    result = open(getSearchItemUrl())
    doc = REXML::Document.new(result)

    searchDicItemResult = SearchDicItemResult.new();
    searchDicItemResult.parse(doc.to_s())

    if searchDicItemResult.totalHitCount == 0.to_s() then
      puts "no such word."
      return
    end

    @itemId = searchDicItemResult.titleList[0].itemId
    getDicItem()
  end

  def getSearchItemUrl
    return SEARCH_ITEM_URL +
        "&Scope=" + SCOPE +
        "&Match=" + MATCH +
        "&Merge=" + MERGE +
        "&Prof=" + PROF +
        "&PageSize=" + PAGE_SIZE.to_s() +
        "&PageIndex=" + PAGE_INDEX.to_s() +
        "&Word=" + URI::escape(@word)
  end

  def getGetItemUrl
    return GET_ITEM_URL +
        "&Prof=" + PROF +
        "&Loc=" +
        "&Item=" + @itemId
  end
end
