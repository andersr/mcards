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
    @cards = Card.all
    @card = Card.find(params[:id])
    @card.destroy

    respond_to do |format|
      format.html { redirect_to cards_path, notice: "The card was deleted." }
      format.xml {head :ok}
    end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def random
    @random_cards = Card.all.sample(5)
  end

  private

    def card_params
      params.require(:card).permit(:phrase, :help)
    end
end
