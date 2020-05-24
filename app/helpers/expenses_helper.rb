module ExpensesHelper
    def get_user_name(user_id)
        user_id.blank? ? '' : Employee.find(params[:id], user_id).name
    end
    def format_date(data_expense)
        data_expense.blank? ? '' : data_expense.strftime("%d/%m/%Y")
    end
end
