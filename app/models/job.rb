class Job < ApplicationRecord
  validates :description, :presence => {:message => 'You must enter a job description.'}
  validates :salary, :presence => {:message => 'You must enter valid job salary.'},
            :numericality => { :only_integer => {:message => 'Salary must be only integer.'} },
            :numericality => { :greater_than => 0}
end
