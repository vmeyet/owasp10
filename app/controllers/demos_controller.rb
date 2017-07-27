class DemosController < ApplicationController
  layout 'demo'

  def code_injection
    render :code_injection
  end

  def sql_injection
    render :sql_injection
  end

  def blind_sql_injection
    render :blind_sql_injection
  end
end
