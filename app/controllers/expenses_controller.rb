class ExpensesController < ApplicationController
  helper ExpensesHelper
  load_and_authorize_resource
  before_action :set_expense, only: [:show, :edit, :update, :approve, :deny, :user_name]

  # GET /expenses
  # GET /expenses.json
  def index
    if current_manager != nil
      @expenses = Expense.all
    elsif current_employee != nil
      @expenses = Expense.where(user_id: current_employee.id)
    end
    :user_name
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(expense_params)
    @expense.user_id = current_employee.id
    @expense.status = 'Aberto'
    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    if @expense.status == 'Negada'
      @expense.status = 'Reaberto'
    end
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve
    @expense = Expense.find(params[:id])
    @expense.update_attributes({:status => 'Aprovada'})
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully approved.' }
      format.json { head :no_content }
    end
  end

  def deny
    @expense = Expense.find(params[:id])
    @expense.update_attributes({:status => 'Negada'})
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully Denied.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expense_params
      params.require(:expense).permit(:description, :date, :value, :picture)
    end

  
end
