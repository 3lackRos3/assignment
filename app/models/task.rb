class Task < ApplicationRecord
    validates_presence_of :name, :status, :priority
    validates_inclusion_of :status, :in => %w( Completed Pending )
    validates_inclusion_of :priority, :in => %w( High Medium Low )
end
