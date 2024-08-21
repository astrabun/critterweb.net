Jekyll::Hooks.register :pages, :post_init do |page|
  if page.data["json_layout"] && page.data["json_permalink"]
    json_page = page.dup
    json_page.data["layout"] = page.data["json_layout"]
    json_page.data["permalink"] = page.data["json_permalink"]
    page.site.pages << json_page
  end
end
