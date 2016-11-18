require 'roo'

Translation.delete_all;

def html_breaker(html)
  tagsRegExp = /(<\/?\w+(?:(?:\s+\w+(?:\s*=\s*(?:".*?"|'.*?'|[^'">\s]+))?)+\s*|\s*)\/?>)/
  nbspsRegExp = /(&nbsp;)/
  jsRegExp = /(function.*?})/
  regex = Regexp.union(nbspsRegExp, tagsRegExp, jsRegExp)
  @text_arr = html.split(regex)
end

xlsx = Roo::Spreadsheet.open('/Users/dasboogaloo/Downloads/2016NonUSNonMgmtCriterionSurvey_SupervsrTranslations_toDLS_5.10.16.xlsx')
sheet = xlsx.sheet('Questions')
translation = []
sheet.each(id: 'id', raw_text: 'en-US') do |hash|
  translation.push(
    {
      id:hash[:id],
      raw_text: hash[:raw_text]
    }
  )
end

translation.each_with_index do |row, index|
  Translation.create({
    
    })
end
