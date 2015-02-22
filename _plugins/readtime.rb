# jekyll-readtime
# 2015 Ron Scott-Adams, Licensed under MIT:
# https://tldrlegal.com/license/mit-license
# Original work: https://gist.github.com/zachleat/5792681

# Outputs the estimated time the average person might take to read the content.
# 200 is a round figure based on estimates gathered from various studies.
# http://www.ncbi.nlm.nih.gov/pubmed/18802819

# Usage: {{ page.content | readtime }}
# will emit as e.g. "4 minutes" or "1 minute"
module ReadTime
  def readtime(input)
    words_per_minute = 200
    words = input.split.size
    minutes = (words / words_per_minute).floor
    minutes_label = minutes == 1 ? ' minute' : ' minutes'
    minutes > 0 ? "#{minutes} #{minutes_label}" : 'less than a minute'
  end
end

Liquid::Template.register_filter(ReadTime)
