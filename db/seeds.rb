require 'roo'
require 'roo-xls'

Translation.destroy_all;

def html_breaker(html)
  tagsRegExp = /(<\/?\w+(?:(?:\s+\w+(?:\s*=\s*(?:".*?"|'.*?'|[^'">\s]+))?)+\s*|\s*)\/?>)/
  nbspsRegExp = /(&nbsp;)/
  jsRegExp = /(function.*?})/
  regex = Regexp.union(nbspsRegExp, tagsRegExp, jsRegExp)
  @text_arr = html.split(regex)
end

# xlsx = Roo::Spreadsheet.open('./2016NonUSNonMgmtCriterionSurvey_SupervsrTranslations_toDLS_5.10.16.xlsx')
# xlsx = Roo::Spreadsheet.open('./GRS_Correspondence_translation_spreadsheet_Languages_4.xlsx')
xlsx = Roo::Spreadsheet.open('./Textool_Update_April_May_Projects_03312017.xlsx');
sheet = xlsx.sheet('Sheet1').column(2)

puts "sheet: #{sheet}"

translation = []
sheet.each_with_index do |hash, index|
  translation.push(
    {
      id: index,
      raw_text: hash
    }
  )
end

translation.each do |row|
  Translation.create([
    {
      content:row[:raw_text],
      category: row[:id]
    }
  ])
end
