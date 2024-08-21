Jekyll::Hooks.register :pages, :post_init do |page|
  if page.data["json_permalink"]
    json_page = page.dup
    json_page.data["permalink"] = page.data["json_permalink"]
    json_page.data["layout"] = "ring"
    page.site.pages << json_page
  end
end
