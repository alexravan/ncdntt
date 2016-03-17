class ApiController < ApplicationController
	protect_from_forgery with: :null_session
	skip_before_filter  :verify_authenticity_token

# TODO: 5. get incident by severity, etc

# GET /api/getincidents
# Requires nothing
# Returns all incidents (JSON)
	def getIncidents
		@incidents = Incident.all
		size = 'square'

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
			:updated_at => i.updated_at,
			:media_url => i.media.url(size)
		}
		end
		respond_to do |format|
		format.json { render :json => @ilist.to_json }
		format.html { render :json => @ilist.to_json }
		end
	end

# GET /api/getIncident
# Requires incident ID
# Returns a single incident (JSON)
	def getIncident
		if (params[:id].present?) && (Incident.exists?(params[:id]))
			id = params[:id].to_i
			# size = 'square'
			# js = Incident.find(id).to_json
			# js["media_url"] = Incident.find(id).media.url(size).to_s
			respond_to do |format|
				format.json {render :json => Incident.find(id).to_json}
				format.html {render :json => Incident.find(id).to_json}
			end
		else
			respond_to do |format|
				format.json {render status: 400, json: {
					    	message: "incident with that id does not exist",
							}.to_json}
				format.html {render status: 400, json: {
					    	message: "incident with that id does not exist",
							}.to_json}
			end
		end
	end

# POST api/createincident
# Requires all incident parameters apart from image and description
# Returns created incident (JSON)
	def createIncident
		if ((params[:title].present?) && (params[:user_id].present?) && (params[:category_id].present?) && (params[:severity].present?) && (params[:location].present?) && (User.exists?(params[:user_id])))
			@new_params = {
				:title => params[:title].to_s,
				:user_id => params[:user_id].to_i,
				:category_id => params[:category_id].to_i,
				:severity => params[:severity].to_i,
				:location => params[:location].to_s,
				:description => ""
			}
			# OPTIONAL
			if (params[:description].present?)
				@new_params[:description] = params[:description].to_s
			end
			Incident.create(@new_params)
			respond_to do |format|
				format.json {render :json => Incident.last}
				format.html {render :json => Incident.last}
			end
		else
			respond_to do |format|
				format.json {render status: 400, json: {
					    	message: "ill-formed parameters",
							}.to_json}
				format.html {render status: 400, json: {
					    	message: "ill-formed parameters",
							}.to_json}
			end
		end
	end

# POST api/updateincident
# Requires incident ID, then any updated fields
# Returns updated incident (JSON)
	 def updateIncident
	 	if (params[:id].present?) && (Incident.exists?(params[:id]))
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
		else
			respond_to do |format|
				format.json {render status: 400, json: {
					    	message: "incident with that id does not exist",
							}.to_json}
				format.html {render status: 400, json: {
					    	message: "incident with that id does not exist",
							}.to_json}
			end
		end
	end

# POST api/closeincident,
# Requires incident ID ID and (optional) closing comment
# Returns closed incident (JSON)
# will require authorization
	def closeIncident
		if (params[:id].present?) && (Incident.exists?(params[:id]))
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
		else
			respond_to do |format|
				format.json {render status: 400, json: {
					    	message: "incident with that id does not exist",
							}.to_json}
				format.html {render status: 400, json: {
					    	message: "incident with that id does not exist",
							}.to_json}
			end
		end
	end

# POST api/deleteincident,
# Requires incident ID
# Returns nothing
# will require authorization!
	def deleteIncident
		if (params[:id].present?) && (Incident.exists?(params[:id]))
			id = params[:id].to_i
			Incident.find(id)
			respond_to do |format|
				format.json {render :json => Incident.find(id).to_json}
				format.html {render :json => Incident.find(id).to_json}
			end
			Incident.destroy(id)
		else
			respond_to do |format|
				format.json {render status: 400, json: {
					    	message: "incident with that id does not exist",
							}.to_json}
				format.html {render status: 400, json: {
					    	message: "incident with that id does not exist",
							}.to_json}
			end
		end
	end

# POST api/createuser
# Requires first_name, last_name, email, password, password_confirmation
# Returns user (JSON)
	def createUser
		if ((params[:email].present?) && (params[:first_name].present?) && (params[:last_name].present?) && (params[:password].present?) && (params[:password_confirmation].present?))
					@new_params = {
						:email => params[:email].to_s,
						:first_name => params[:first_name].to_s,
						:last_name => params[:last_name].to_s,
						:password => params[:password].to_s,
						:password_confirmation => params[:password_confirmation].to_s,
					}

					User.create(@new_params)
					#  RETURN ID????
					respond_to do |format|
						format.json {render :json => User.last}
						format.html {render :json => User.last}
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

# GET /api/getusers
# Requires nothing
# Returns all users (JSON)
	def getUsers
		@users = User.all
		@ilist = @users.map do |i| {
			:id => i.id,
			:email => i.email,
			:first_name => i.first_name,
			:last_name => i.last_name,
			:last_sign_in_at => i.last_sign_in_at,
			:created_at => i.created_at,
			:sign_in_count => i.sign_in_count,
			:current_sign_in_at => i.current_sign_in_at,
			:updated_at => i.updated_at
		}
		end
		respond_to do |format|
		format.json { render :json => @ilist.to_json }
		format.html { render :json => @ilist.to_json }
		end
	end

# GET /api/getCategories
# Requires nothing
# Returns all possible incident categories (JSON)
	def getCategories
		@categories = Category.all
		@ilist = @categories.map do |i| {
			:id => i.id,
			:name => i.name
		}
		end
		respond_to do |format|
		format.json { render :json => @ilist.to_json }
		format.html { render :json => @ilist.to_json }
		end
	end
end
