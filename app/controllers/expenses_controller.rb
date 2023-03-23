class ExpensesController < ApplicationController # :nodoc:
  before_action :authenticate_user!
  def new
    @expense = Expense.new
  end

  def create
    @groups = params[:expense][:group_id].drop(1)
    @groups.each do |group|
    @expense = Expense.new(name: params[:expense][:name], amount: params[:expense][:amount],
                             group_id: group.to_i, user_id: current_user.id)
     @group = Group.where(id: group)
     @expense.groups << [@group]
    end
    @expense.save
    redirect_to group_path(@groups.first.to_i)
  end

  private

  def expense_params
    params.require(:expense).permit(:group_id, :amount, :name).merge(user_id: current_user.id)
  end
end
