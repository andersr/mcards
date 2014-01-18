class CardsController < ApplicationController


  def show
    @card = Card.find(params[:id])
  end

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html {
          redirect_to card_path(@card), notice: "Card created!" }
        format.json { head :no_content }
      else
        format.html { render action: "new", notice: "Sorry, there was a problem :-/" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @card = Card.find(params[:id])

    respond_to do |format|
      if @card.save
        format.html {
          redirect_to card_path(@card), notice: "Card updated!" }
        format.json { head :no_content }
      else
        format.html { render action: "edit", notice: "Sorry, there was a problem :-/" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def destroy
    
  end

  def edit
    @card = Card.find(params[:id])
  end

  def random
    id = rand(1..Card.count)
    @card = Card.find(id)
  end

  private

    def card_params
      params.require(:card).permit(:phrase)
    end
end
