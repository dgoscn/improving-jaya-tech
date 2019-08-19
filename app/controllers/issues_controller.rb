class IssuesController < ApplicationController
  before_action :set_issue, only: [:show]

  def index
    @issues = Issue.all
    render json: @issues
  end

  def show
    render json: @issue
  end


  private
    def set_issue
      @issue = Issue.find(params[:id])
    end
end
