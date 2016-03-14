class ApiController < ApplicationController
	protect_from_forgery with: :null_session
	skip_before_filter  :verify_authenticity_token

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

# POST create incident // return json incident
	# def createIncident
	# 	#@request.env['RAW_POST_DATA'] = @new_project_json.to_json
	# 	puts "post params are"
	# 	puts params.inspect
	# 	puts params[:name]

	# 	if (params[:title] != nil || params[:title]  != ""
	# 		|| params[:usr] != nil || params[:usr] != ""
	# 		|| params[:cat] != nil || params[:cat] != ""
	# 		|| params[:des] != nil || params[:des] != ""
	# 		|| params[:sev] != nil || params[:sev] != ""
	# 		|| params[:loc] != nil || params[:loc] != ""
	# 		|| params[:img] != nil || params[:img] != "")

	# 			puts "All the required parameters are there"
	# 			Incident.create(params)
	# 	end
	# end
# POST update incident, give id and fields // return incident
# POST delete incident, give id // return nothing
	def createIncident
	end
# POST update incident, give id and fields // return incident
# need ID param, then any updated fields
	def updateIncident
		id = params[:id].to_i
		@new_params = {
			:title => params[:title].to_s,
			:category_id => params[:category].to_i,
			:severity => params[:severity].to_i,
			:location => params[:location].to_s,
			:description => params[:description].to_s
		}
		Incident.find(id).update(@new_params)
		respond_to do |format|
			format.json {render :json => Incident.find(id).to_json}
			format.html {render :json => Incident.find(id).to_json}
		end
	end

# POST close incident, give ID and closing comment
	def closeIncident
		id = params[:id].to_i
		@new_params = {
			:date_closed => DateTime.now,
			:closing_comment => params[:comment].to_s
		}
		Incident.find(id).update(@new_params)
			respond_to do |format|
				format.json {render :json => Incident.find(id).to_json}
				format.html {render :json => Incident.find(id).to_json}
			end
		end
# POST delete incident, give id // return nothing
	def deleteIncident
		#Incident.find(id).update(@new_params)
		#@new_params = {
		#	:id => params[:id].to_i,
		#	:title => params[:title].to_s,
		#	:user_id => params[:user_id].to_i,
		#	:category_id => params[:category].to_i,
		#	:severity => params[:severity].to_i,
		#	:location => params[:location].to_s,
		#	:is_closed => params[:is_closed].to_i,
		#	:severity => params[:severity].to_i,
		#	:date_closed => params[:date_closed].to_s,
		#	:created_at => params[:created_at].to_s,
		#	:updated_at => params[:updated_at].to_s,
		#	:closing_comment => params[:closing_comment].to_s,
		#}
		#respond_to do |format|
		#	format.json { render :json => @new_params.to_json }
		#	format.html { render :json => @new_params.to_json }
		#end
		id = params[:id].to_i
		Incident.find(id)
		respond_to do |format|
			format.json {render :json => Incident.find(id).to_json}
			format.html {render :json => Incident.find(id).to_json}
		end
		Incident.destroy(id)
	end
end
