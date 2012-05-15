# place this file in your plugins directory and add the tag to your sidebar
#$ cat source/_includes/asides/categories.html 
#<section>
#  <h1>Categories</h1>
#  <ul id="categories">
#    {% category_list %}
#  </ul>
#</section>

module Jekyll
  class CategoryListTag < Liquid::Tag
	def render(context)
      html = ""
      categories = context.registers[:site].categories.keys
      dir = context.registers[:site].config['category_dir']
      categories.sort!.map do |category|
        posts_in_category = context.registers[:site].categories[category].size
        url =  dir+"/"+category.gsub(/_|\P{Word}/, '-').gsub(/-{2,}/, '-').downcase
        html << "<li class='category'><a href=' /#{url}/'>#{category} (#{posts_in_category})</a></li>\n"
      end
      html
    end
  end
end

Liquid::Template.register_tag('category_sidebar', Jekyll::CategoryListTag)
