class DatasetsController < ApplicationController
	before_action :authenticate_business!
	before_action :find_dataset

	def create
		@dataset = current_business.datasets.new(dataset_params)
		if @dataset.save
			redirect_to businesses_show_path
		else
			if @dataset.errors.any?
				@dataset.errors.full_messages.each do |message|
					flash[:notice] = message
				end
			end
			redirect_back fallback_location: root_path
		end
	end

	def destroy
		@dataset.destroy
		redirect_to root_path,flash[:notice]  => "dataset deleted Successfully"
	end

	def update
		if @dataset.update(dataset_params)
			redirect_to @dataset
		else
			redirect_back fallback_location: root_path
		end
	end

	private

	def find_dataset
		@dataset = Dataset.find(params[:id])
	end

	def dataset_params
		params.require(:dataset).permit(:data)
	end
end