require 'feedjira'

namespace :sync do
    task blogs: [:environment] do
        Blog.all.each do |blog|
        rss = Feedjira::Feed.fetch_and_parse blog.rss_url
            rss.entries.each do |entry|

                if Nokogiri::HTML.parse(entry.summary).css('img').present?
                    thumbnail = Nokogiri::HTML.parse(entry.summary).css('img').to_html
                end

                if Nokogiri::HTML.parse(entry.content).css('img').present?
                    thumbnail = Nokogiri::HTML.parse(entry.content).css('img').to_html
                end
                
                local_entry = blog.articles.where(title: entry.title).first_or_initialize
                local_entry.update_attributes(content: entry.content, author: entry.author, url: entry.url, published: entry.published, thumbnail: thumbnail)
            end
        end
    end
end

  #first_or_initialize
  #firstがない場合、first_or_initailizeの第一引数でオブジェクトを初期化する？
  #レコードをまだ保存したくない場合に使うらしい？

  #update_attributes
  #データベースの値を複数同時に更新するために利用するメソッドらしい。
  #save → 変更のあった属性を更新
  #update_attributes → 引数で指定したHashオブジェクトで更新

  #メソッドの呼び出しによってfeedが取得できる
  #rss = Feedjira::Feed.fetch_and_parse(feed_url)