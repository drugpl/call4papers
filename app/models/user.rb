class User < ActiveRecord::Base
  has_many :authentications
  has_many :papers

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :bio, :website_url, :password, :password_confirmation, :remember_me

  validates :name, presence: true
  validates :email, presence: true

  scope :staff,       where(staff: true)
  scope :contributor, where(staff: nil)

  def apply_omniauth(omniauth)
    provider, uid, info = omniauth.values_at('provider', 'uid', 'info')
    self.email = info['email'] if email.blank?
    self.name  = info['name']  if name.blank?

    apply_provider_handle(omniauth)
    authentications.build(provider: provider, uid: uid)
  end

  def apply_provider_handle(omniauth)
    provider, info = omniauth.values_at('provider', 'info')

    case provider
    when /github/
      self.github_handle  = info['nickname'] if github_handle.blank?
    when /twitter/
      self.twitter_handle = info['nickname'] if twitter_handle.blank?
    end
  end

  def password_required?
    (authentications.empty? || password.present?) && super
  end

  def connected_with_twitter?
    authentications.where(provider: 'twitter').first
  end

  def connected_with_github?
    authentications.where(provider: 'github').first
  end

  def can_edit_paper?(paper)
    papers.exists?(paper)
  end

  def has_bio?
    ! bio.blank?
  end

  def has_proposal?
    ! papers.empty?
  end
end
