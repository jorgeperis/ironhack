class TournamentsController < ApplicationController
  def index
    render(:index)
  end

  def api
    tournaments = Tournament.all
    render json: tournaments
  end

  def create
    newTournament = Tournament.create name: params[:tournament][:name]
    render json: newTournament,
    status: 201
  end
  def delete
    tournament = Tournament.find_by(id: params[:id])
    tournament.destroy
    render json: tournament,
     status:200
  end
end
