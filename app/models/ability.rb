# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)      
    if user.is_a?(Manager)
      #can Page
      can :manage, Manager
      can [:show, :index, :approve], Expense
    elsif user.is_a?(Employee)
      #can Page
      can :manage, Employee
      can [:index, :create, :show, :read, :update, :edit], Expense
    #else
    #  can Page, :all
    #end
    end
  end
  #def initialize(manager)
    #can [:show, :read, :update, :edit, :aproval], Expense
    #can :manage, :all
    #@corrent_user = corrent_manager
    #cannot :create, Expense
    #can :manage, Manager
  #end
  #def initialize(employee)
    #can :manage, Employee 
    #@corrent_user = corrent_manager
    #can [:show, :read, :update, :edit, :deploy], Expense, ["user_id == ?", employee.id] do |expense|
    #end
    #cannot [:show, :read, :update, :edit], Expense, ["user_id != ?", employee.id] do |expense|
    #end
  #end
end
