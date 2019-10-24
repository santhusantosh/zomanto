class RestHighlightsController < ApplicationController
  
  before_action :authenticate_user!, except: [ :index,:show]
  before_action :check_is_admin, except: [:index, :show,:new,:edit]
  before_action :set_rest_highlight, only: [:show, :edit, :update, :destroy]

  # GET /rest_highlights
  # GET /rest_highlights.json
  def index
    @rest_highlights = RestHighlight.all
  end

  # GET /rest_highlights/1
  # GET /rest_highlights/1.json
  def show
  end

  # GET /rest_highlights/new
  def new
    @rest_highlight = RestHighlight.new
  end

  # GET /rest_highlights/1/edit
  def edit
  end

  # POST /rest_highlights
  # POST /rest_highlights.json
  def create
    @rest_highlight = RestHighlight.new(rest_highlight_params)

    respond_to do |format|
      if @rest_highlight.save
        format.html { redirect_to @rest_highlight, notice: 'Rest highlight was successfully created.' }
        format.json { render :show, status: :created, location: @rest_highlight }
      else
        format.html { render :new }
        format.json { render json: @rest_highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rest_highlights/1
  # PATCH/PUT /rest_highlights/1.json
  def update
    respond_to do |format|
      if @rest_highlight.update(rest_highlight_params)
        format.html { redirect_to @rest_highlight, notice: 'Rest highlight was successfully updated.' }
        format.json { render :show, status: :ok, location: @rest_highlight }
      else
        format.html { render :edit }
        format.json { render json: @rest_highlight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rest_highlights/1
  # DELETE /rest_highlights/1.json
  def destroy
    @rest_highlight.destroy
    respond_to do |format|
      format.html { redirect_to rest_highlights_url, notice: 'Rest highlight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rest_highlight
      @rest_highlight = RestHighlight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rest_highlight_params
      params.require(:rest_highlight).permit(:restaurant_id, :highlight_id)
    end
end
