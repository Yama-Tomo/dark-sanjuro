# -*- coding: utf-8 -*-
class MediaConvertersController < ApplicationController
  # GET /media_converters
  # GET /media_converters.json
  def index
    @media_converters = MediaConverter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @media_converters }
    end
  end

  # GET /media_converters/1
  # GET /media_converters/1.json
  def show
    @media_converter = MediaConverter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @media_converter }
    end
  end

  # GET /media_converters/new
  # GET /media_converters/new.json
  def new
    @media_converter = MediaConverter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @media_converter }
    end
  end

  # GET /media_converters/1/edit
  def edit
    @media_converter = MediaConverter.find(params[:id])
  end

  # POST /media_converters
  # POST /media_converters.json
  def create
    @media_converter = MediaConverter.new(params[:media_converter])

    respond_to do |format|
      if @media_converter.save
        format.html { redirect_to @media_converter, notice: 'メディコンマスターの登録が完了しました.' }
        format.json { render json: @media_converter, status: :created, location: @media_converter }
      else
        format.html { render action: "new" }
        format.json { render json: @media_converter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /media_converters/1
  # PUT /media_converters/1.json
  def update
    @media_converter = MediaConverter.find(params[:id])

    respond_to do |format|
      if @media_converter.update_attributes(params[:media_converter])
        format.html { redirect_to @media_converter, notice: 'メディコンマスターの更新が完了しました.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @media_converter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_converters/1
  # DELETE /media_converters/1.json
  def destroy
    @media_converter = MediaConverter.find(params[:id])
    @media_converter.destroy

    respond_to do |format|
      format.html { redirect_to media_converters_url, notice: 'メディコンマスターの削除が完了しました.' }
      format.json { head :no_content }
    end
  end
end
