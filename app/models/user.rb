class User < ApplicationRecord
    has_one :blog

    has_secure_password
    before_save { self.email.downcase! }

    validates :name, {presence: true, uniqueness: true, length:{maximum:10}}
    validates :email, {presence: true, uniqueness: true}
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
    validates :password, {presence: true, length:{minimum:6}, on: :create}
    validates :profile, {length: {maximum:30}}

    attr_accessor :activation_token, :reset_token
    before_save   :downcase_email
    before_create :create_activation_digest #オブジェクトが生成されるときにだけ呼び出す

    def posts
        return Post.where(user_id: self.id)
    end

    # 引数のハッシュ値を返す
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : 
        BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # ランダムトークン生成
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    # 永続的セッションで使用するユーザーをデータベースに記憶する
    def create_reset_digest
        self.reset_token = User.new_token   #selfでattr_accessorで作ったインスタンスメソッドreset_tokenが呼ばれる
        update_attribute(:reset_digest,  User.digest(reset_token))  #「update_attribute」はデータベースから取得したオブジェクトを更新するということ
        update_attribute(:reset_sent_at, Time.zone.now)
    end

    # メールアドレスをすべて小文字にする
    def downcase_email
        self.email = email.downcase
    end

    # パスワード再設定のメールを送信する
    #再設定用ダイジェストはデータベースに保存、再設定用トークンはメールアドレスと一緒にユーザーに送信する有効化用メールのリンクに仕込んでおく
    def send_password_reset_email
        UserMailer.password_reset(self).deliver_now
    end

    # パスワード再設定の期限が切れている場合はtrueを返す
    def password_reset_expired
        reset_sent_at < 2.hours.ago
    end

    # トークンがダイジェストと一致したらtrueを返す
    def authenticated?(attribute, token)
        digest = self.send("activation_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end

    # 有効化トークンとダイジェストを作成
    private
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end

end
