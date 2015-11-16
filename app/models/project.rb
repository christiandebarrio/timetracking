class Project < ActiveRecord::Base
  def self.iron_find(params)
    where(params).first
  end

  def self.clean_old
    where('create_at < ?', Time.now - 1.week).destroy_all
  end
end
