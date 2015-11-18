class Project < ActiveRecord::Base
  has_many :entries

  validates :name, uniqueness: true
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validates :name, format: { with: /\A[A-Za-z0-9ñÑ]+[A-Za-z0-9ñÑ\ ]+\z/ }

  def self.iron_find(params)
    where(params).first
  end

  def self.clean_old
    where('create_at < ?', Time.now - 1.week).destroy_all
  end

  def self.last_created_projects(max) 
    order('created_at DESC').limit(max)
  end

  def self.first_updated_projects(max)
    order('updated_at ASC').limit(max)
  end

  def total_hours_in_month(month, year)
    from = Date.new(year,month,1)
    to = from.end_of_month

    month_entries = entries.where(date: from..to)
    
    
    total_minutes = month_entries.reduce(0) do |sum, entry|
      sum + entry.minutes + entry.hours * 60
    end

    total_hours = total_minutes / 60.0
    
  end
end
