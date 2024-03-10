class EntriesController < ApplicationController

  def new
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = session["user_id"]
    @entry.uploaded_image.attach(params["entry"]["uploaded_image"]) if params["entry"]
    if @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
    else
    end
  end

end
