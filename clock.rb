require 'clockwork'
require 'active_support/all'

#require File.expand_path('../config/boot', __FILE__)
#require File.expand_path('../config/environment', __FILE__)


include Clockwork

module Clockwork
  every(1.minute, 'minute') do
    puts "start"
    system "rake sync:blogs"
    puts "finish"
  end


  every(24.hour, 'hour') do
    puts "start"
    system "rake point_count:blogs"
    puts "finish"
  end

end
#https://qiita.com/ruko_zss/items/e9dc6a93ddccaf370229

#バックグラウンドでシステムを実行する方法
#https://tech.nikkeibp.co.jp/it/atcl/column/15/042000103/080600052/