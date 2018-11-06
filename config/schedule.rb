# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#

set :output, "log/crontab.log"
set :environment, :production

 every 1.minute do
   rake "sync:blogs"
 end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

#20180924　"popen" No such file or directory - crontab(Errno::ENOENT)
#cronはUNIX環境コマンドの為、Windows環境では使用できない
#そのためclockworkで実装を試みる

#20180924
#rakeが実行できない
#wheneverで実装できないかどうか再度試みる



# bundle exec whenever 実行時
#あなたのスケジュールファイルはcron構文に変換されます。 あなたのcrontabファイルは更新されませんでした。
#より多くのオプションを得るには--helpを実行してください

#bundle exec crontab -e　実行時
#bundler：コマンドが見つかりません：crontab
#バンドルインストールで不足しているgem実行ファイルをインストールする