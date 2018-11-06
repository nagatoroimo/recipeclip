class UserMailer < ApplicationMailer

  # アカウント有効化メール
  def account_activation(user)
    @user = user
    mail to: user.email,　subject:"アカウントの有効化について"
  end

  # アカウントパスワードリセットメール
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "パスワードリセットについて"
  end
end
