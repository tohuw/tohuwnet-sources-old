# encoding: utf-8
#
# Jekyll Tipue Search Content generator.
# check http://www.tipue.com/search for more info
#
# Based upon version 0.1.1 of generate_tipue.rb,
#   Copyright (c) 2014 Nuno Furtado, http://about.me/nuno.furtado
#   Licensed under the MIT license
#   (http://www.opensource.org/licenses/mit-license.php)
#
# A generator that creates a JSON file based on your current posts.
# This file is consumed by Tipue Search.
#
# To use it, simply drop this script into the _plugins directory.
#
# If you provide a 'summary' meta element in your post, that will be used for
# the description.
# Otherwise, the first 25 characters of the post itself will be used instead.
#
# Categories from each post are loaded into Tipue tags, making them searchable.
# If you use a 'tags' element, these are likewise loaded and searchable.

require 'json'
module Jekyll
  # This object represents page information to be written to the JSON file.
  class TipuePage
    # Initializes a new TipuePage.
    #
    #  +title+ Page Title
    #  +tags+  Page Tags
    #  +loc+   Page url
    #  +text+  Page Description
    def initialize(title, tags, loc, text)
      @title  = title
      @tags = tags
      @loc = loc
      @text= text
    end

    def to_json
      hash = {}
      instance_variables.each do |var|
        hash[var.to_s.delete '@'] = instance_variable_get var
      end
      hash.to_json
    end
  end

  # This generator recreates js/searchcontent.js on every `jekyll build`
  class TipueGenerator < Generator
      safe true

      def generate(site)

          pages=Array.new
          target = File.open('js/tipuesearch_content.js', 'w')
          target.truncate(target.size)
          target.puts('var tipuesearch = {"pages": [')

          all_but_last, last = site.posts[0..-2], site.posts.last

          #Process all posts but the last one
          all_but_last.each do |page|

              tp_page = TipuePage.new(page.data['title'],page.data['tags'].to_s .concat(' ').concat(page.data['categories'].to_s),page.url,page.data['tipue_description'].to_s)
              target.puts(tp_page.to_json + ',')

          end

          #Do the last
          tp_page = TipuePage.new(last.data['title'],last.data['tags'].to_s.concat(' ').concat(last.data['categories'].to_s),last.url,last.data['tipue_description'].to_s)
          target.puts(tp_page.to_json)

          target.puts(']};')
          target.close()
      end
end

end
