# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)      
    if user.is_a?(Manager)
      can :manage, Manager
      can [:show, :index, :approve, :deny], Expense 
      cannot :approve, Expense, ["status == ?", 'Aprovada'] do |expense|
        expense.status == 'Aprovada'
      end
    elsif user.is_a?(Employee)
      can :manage, Employee
      can :create, Expense
      can [:index, :show, :read, :update, :edit], Expense , ["user_id == ?", user.id] do |expense|
        expense.user_id == user.id
      end
      cannot [:edit], Expense, ["status == ?", 'Aprovada'] do |expense|
        expense.status == 'Aprovada'
      end
      cannot [:edit], Expense, ["status == ?", 'Rejeitada'] do |expense|
        expense.status == 'Rejeitada'
      end
    end
  end
end
