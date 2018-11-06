class VotesController < ApplicationController

#外部からのPOST送信を許可する方法
#https://qiita.com/KumatoraTiger/items/cc6a1107374cce500e6d

	before_action :time_limit

	def vote
    end


	#カウント数を取得
	#カウント数の多い10件を抜粋
	#1日・1週間・1ヵ月の3パターン

	def ranking
		@week_vote_ranking = WeekInPoint.group(:blog_id).order("count(blog_id) desc")
	end


	def time_limit
		@week_vote = WeekVote.all
		@week_vote.each do |vote|
			if vote.blog_id && vote.created_at > 1.week.from_now
				vote.destroy
			end
		end

		#@manth_vote.each do |vote|
		#	if vote.blog_id && vote.created_at < 1.manth.from_now
		#		manth.destroy
		#	end
		#end
  end
 

end
