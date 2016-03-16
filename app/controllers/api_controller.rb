class ApiController < ApplicationController
	protect_from_forgery with: :null_session
	skip_before_filter  :verify_authenticity_token

# TODO: 1. create incident
# 		4. create user
#  		6. User list?
#       5. get incident by severity, etc
#  		7. validate required params for requests, give error if not present
#       8. categories
# 
#       9. images via API

# GET /api/getIncidents
	def getIncidents
		@incidents = Incident.all
		@ilist = @incidents.map do |i| {
			:id => i.id,
			:title => i.title,
			:category => i.category,
			:description => i.description,
			:severity => i.severity,
			:location => i.location,
			:is_closed => i.is_closed,
			:date_closed => i.date_closed,
			:closing_comment => i.closing_comment,
			:created_at => i.created_at,
			:updated_at => i.updated_at
		}
		end
		respond_to do |format|
		format.json { render :json => @ilist.to_json }
		format.html { render :json => @ilist.to_json }
		end
	end

# GET /api/getIncident
# requires ID, returns single incident
	def getIncident
		id = params[:id].to_i
		respond_to do |format|
			format.json {render :json => Incident.find(id).to_json}
			format.html {render :json => Incident.find(id).to_json}
		end	
	end

# POST create incident // return json incident
	def createIncident
		puts "post params are"
		puts params.inspect
		puts params[:name]

		if ((params[:title].present?) && (params[:user_id].present?) && (params[:category_id].present?) && (params[:severity].present?) && (params[:location].present?))
				Incident.create(params)
				#  RETURN ID????
				respond_to do |format|
					format.json {render :json => params}
					format.html {render :json => params}
				end	
		else 
			resp = {
				:error => "ill formed parameters"
			}
			respond_to do |format|
				format.json {render :json => resp}
				format.html {render :json => resp}
			end	
		end
	end

# POST update incident, give id and fields // return incident
# need ID param, then any updated fields
	 def updateIncident
		id = params[:id].to_i
		@inci = Incident.find(id)
		@new_params = {
			:title => @inci[:title].to_s,
			:user_id => @inci[:user_id].to_i,
			:category_id => @inci[:category_id].to_i,
			:severity => @inci[:severity].to_i,
			:location => @inci[:location].to_s,
			:description => @inci[:description].to_s
		}
		if (params[:title].present?)
				@new_params[:title] = params[:title].to_s
		end 
		if (params[:category_id].present?)
				@new_params[:category_id] = params[:category_id].to_i
		end
		if (params[:severity].present?)
				@new_params[:severity] = params[:severity].to_i
		end
		if (params[:location].present?)
				@new_params[:location] = params[:location].to_s
		end
		if (params[:description].present?)	
				@new_params[:description] = params[:description].to_s
		end
		Incident.find(id).update(@new_params)
		respond_to do |format|
			format.json {render :json => Incident.find(id).to_json}
			format.html {render :json => Incident.find(id).to_json}
		end	
	end

# POST close incident, give ID and (optional) closing comment
# will require authorization
	def closeIncident
		id = params[:id].to_i
		@inc = Incident.find(id)
		@new_params = {
					:title => @inc[:title].to_s,
					:user_id => @inc[:user_id].to_i,
					:category_id => @inc[:category_id].to_i,
					:severity => @inc[:severity].to_i,
					:location => @inc[:location].to_s,
					:description => @inc[:description].to_s,
					:is_closed => true,
					:date_closed => DateTime.now,
					:closing_comment => ""
				}
		if params[:closing_comment].present?
			@new_params[:closing_comment] = params[:closing_comment]
		end
		Incident.find(id).update(@new_params)
		respond_to do |format|
			format.json {render :json => Incident.find(id).to_json}
			format.html {render :json => Incident.find(id).to_json}
		end
	end

# POST delete incident, give id // return nothing
# will require authorization!
	def deleteIncident
		id = params[:id].to_i
		Incident.find(id)
		respond_to do |format|
			format.json {render :json => Incident.find(id).to_json}
			format.html {render :json => Incident.find(id).to_json}
		end
		Incident.destroy(id)
	end
end
