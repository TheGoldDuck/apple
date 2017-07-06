module DefaultPageContent
    extend ActiveSupport::Concern

  included do
    before_filter :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Devcamp Portfolio | Lone's Website"
    @seo_keywords = "Hunter Sorensen"
  end
end
