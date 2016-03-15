class ApiController < ApplicationController
	protect_from_forgery with: :null_session
	skip_before_filter  :verify_authenticity_token

# TODO: 1. create
# 		3. make update params optional
# 		4. create user

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
			:user_id => params[:user_id].to_i,
			:category_id => params[:category].to_i,
			:severity => params[:severity].to_i,
			:location => params[:location].to_s,
			:description => params[:description].to_s
		}
		Incident.find(id).update(@new_params)
		# @new_params = {}
		# if (params[:title].blank? == false)
		# 		@new_params[:title] => params[:title].to_s
		# end 
		# if (params[:category_id].present?)
		# 		@new_params[:category_id] => params[:category_id].to_i
		# end
		# if (params[:severity].present?)
		# 		@new_params[:severity] => params[:severity].to_i
		# end
		# if (params[:location].present?)
		# 		@new_params[:location] => params[:location].to_s
		# end
		# if (params[:description].present?)	
		# 		@new_params[:description] => params[:description].to_s
		# end
		# Incident.find(id).update(@new_params)
		respond_to do |format|
			format.json {render :json => Incident.find(id).to_json}
			format.html {render :json => Incident.find(id).to_json}
		end	
	end

# POST delete incident, give id // return nothing
# POST close incident, give ID and closing comment
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
	# def deleteIncident
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

# POST delete incident, give id // return nothing
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
