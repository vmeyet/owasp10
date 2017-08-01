class DemosController < ApplicationController
  layout 'demo'

  def code_injection
    render :code_injection
  end

  def sql_injection
    render :sql_injection
  end
end
